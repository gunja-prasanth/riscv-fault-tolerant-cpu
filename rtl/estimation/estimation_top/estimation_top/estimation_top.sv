`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 16:38:37
// Design Name: 
// Module Name: estimation_top
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


module estimation_top (
    input  logic        clk,
    input  logic        reset,

    // tapped control signals
    input  logic [3:0]  fsm_state,
    input  logic        pc_write,
    input  logic        recovery_active,

    // estimation outputs (not used yet)
    output logic [63:0] power_estimate,
    output logic [7:0]  recovery_overhead_pct
);

    // internal wires
    logic [31:0] fsm_transition_count;
    logic [31:0] pcwrite_toggle_count;
    logic [31:0] recovery_cycle_count;
    logic [31:0] total_cycle_count;

    // Activity monitor
    activity_monitor u_activity_monitor (
        .clk(clk),
        .reset(reset),
        .fsm_state(fsm_state),
        .pc_write(pc_write),
        .recovery_active(recovery_active),
        .fsm_transition_count(fsm_transition_count),
        .pcwrite_toggle_count(pcwrite_toggle_count),
        .recovery_cycle_count(recovery_cycle_count)
    );

    // Power estimator
    power_estimator u_power_estimator (
        .clk(clk),
        .reset(reset),
        .fsm_transition_count(fsm_transition_count),
        .pcwrite_toggle_count(pcwrite_toggle_count),
        .recovery_cycle_count(recovery_cycle_count),
        .power_estimate(power_estimate)
    );

    // Performance estimator
    perf_estimator u_perf_estimator (
        .clk(clk),
        .reset(reset),
        .recovery_active(recovery_active),
        .total_cycle_count(total_cycle_count),
        .recovery_cycle_count(),
        .recovery_overhead_pct(recovery_overhead_pct)
    );

endmodule

