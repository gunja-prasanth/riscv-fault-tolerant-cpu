`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 17:02:39
// Design Name: 
// Module Name: activity_monitor
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


module activity_monitor (
    input  logic        clk,
    input  logic        reset,

    // Observed signals
    input  logic [3:0]  fsm_state,
    input  logic        pc_write,
    input  logic        recovery_active,

    // Counters
    output logic [31:0] fsm_transition_count,
    output logic [31:0] pcwrite_toggle_count,
    output logic [31:0] recovery_cycle_count
);

    logic [3:0] fsm_state_prev;
    logic       pc_write_prev;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            fsm_state_prev        <= '0;
            pc_write_prev         <= 1'b0;

            fsm_transition_count  <= 32'd0;
            pcwrite_toggle_count  <= 32'd0;
            recovery_cycle_count  <= 32'd0;
        end
        else begin
            // FSM state transition counter
            if (fsm_state != fsm_state_prev)
                fsm_transition_count <= fsm_transition_count + 1;

            // PC write toggle counter
            if (pc_write != pc_write_prev)
                pcwrite_toggle_count <= pcwrite_toggle_count + 1;

            // Recovery active cycle counter
            if (recovery_active)
                recovery_cycle_count <= recovery_cycle_count + 1;

            // Save previous values
            fsm_state_prev <= fsm_state;
            pc_write_prev  <= pc_write;
        end
    end

endmodule
