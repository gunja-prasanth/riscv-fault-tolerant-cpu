`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 10:54:30
// Design Name: 
// Module Name: power_estimator
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


module power_estimator #(
    // Relative activity weights 
    parameter int FSM_TRANSITION_WEIGHT = 1,
    parameter int PCWRITE_TOGGLE_WEIGHT = 2,
    parameter int RECOVERY_CYCLE_WEIGHT = 3
)(
    input  logic        clk,
    input  logic        reset,

    // Activity counters
    input  logic [31:0] fsm_transition_count,
    input  logic [31:0] pcwrite_toggle_count,
    input  logic [31:0] recovery_cycle_count,

    // Power proxy output
    output logic [63:0] power_estimate
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            power_estimate <= 64'd0;
        end
        else begin
            power_estimate <=
                (fsm_transition_count  * FSM_TRANSITION_WEIGHT) +
                (pcwrite_toggle_count  * PCWRITE_TOGGLE_WEIGHT) +
                (recovery_cycle_count  * RECOVERY_CYCLE_WEIGHT);
        end
    end

endmodule
