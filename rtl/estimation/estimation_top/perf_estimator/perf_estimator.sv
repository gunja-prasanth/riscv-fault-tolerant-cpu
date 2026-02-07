`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 11:36:30
// Design Name: 
// Module Name: perf_estimator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module perf_estimator (
    input  logic        clk,
    input  logic        reset,

    // Observed signals
    input  logic        recovery_active,

    // Counters
    output logic [31:0] total_cycle_count,
    output logic [31:0] recovery_cycle_count,

    // Performance overhead 
    output logic [7:0]  recovery_overhead_pct
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            total_cycle_count      <= 32'd0;
            recovery_cycle_count   <= 32'd0;
            recovery_overhead_pct  <= 8'd0;
        end
        else begin
            // Count total cycles
            total_cycle_count <= total_cycle_count + 1;

            // Count recovery cycles
            if (recovery_active)
                recovery_cycle_count <= recovery_cycle_count + 1;

            // Compute overhead percentage 
            if (total_cycle_count != 0)
                recovery_overhead_pct <=
                    (recovery_cycle_count * 100) / total_cycle_count;
        end
    end

endmodule

