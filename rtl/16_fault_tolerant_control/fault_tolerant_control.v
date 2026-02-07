`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2026 19:28:10
// Design Name: 
// Module Name: fault_tolerant_control
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


module fault_tolerant_control #(
    parameter ENABLE_FAULT_TOLERANCE = 1'b1
)(
    input  wire clk,
    input  wire reset,

    input  wire illegal_opcode,
    input  wire invalid_control,
    input  wire stuck_at_fault,

    input  wire pc_write_normal,
    input  wire reg_write_normal,
    input  wire mem_write_normal,

    input  wire [31:0] pc_current,
    input  wire [31:0] pc_saved,

    output wire pc_write_out,
    output wire reg_write_out,
    output wire mem_write_out,

    output wire [31:0] pc_next,
    output wire        insert_nop,
    output wire        retry_en
);
// ----------------------------------------------------
// Estimation layer outputs (observation only)
// ----------------------------------------------------
wire [63:0] est_power;
wire [7:0]  est_perf_overhead;


    wire [1:0] fault_type;

    wire freeze_cpu;
    wire recover_cpu;
    wire resume_cpu;

    wire safe_mode;
    
        // ----------------------------------------
    // Fault tolerance global enable
    // ----------------------------------------
    wire fault_en;
    assign fault_en = ENABLE_FAULT_TOLERANCE;


    fault_classifier u_fault_classifier (
        .illegal_opcode (illegal_opcode),
        .invalid_control(invalid_control),
        .stuck_at_fault (stuck_at_fault),
        .fault_type     (fault_type)
    );

    recovery_fsm u_recovery_fsm (
        .clk            (clk),
        .reset          (reset),
        .minor_fault    (fault_en & (fault_type == 2'b01)),
        .critical_fault (fault_en & (fault_type == 2'b10)),
        .recovery_done  (resume_cpu),

        .freeze_cpu     (freeze_cpu),
        .recover_cpu    (recover_cpu),
        .resume_cpu     (resume_cpu)
    );

    assign safe_mode = fault_en & (freeze_cpu | recover_cpu);


    recovery_action u_recovery_action (
        .recovery_en (fault_en & recover_cpu),

        .pc_current  (pc_current),
        .pc_saved    (pc_saved),

        .pc_next     (pc_next),
        .insert_nop  (insert_nop),
        .retry_en    (retry_en)
    );

    safe_control_mux u_safe_control_mux (
        .safe_mode        (safe_mode),

        .pc_write_normal  (pc_write_normal),
        .reg_write_normal (reg_write_normal),
        .mem_write_normal (mem_write_normal),

        .pc_write_safe    (1'b0),
        .reg_write_safe   (1'b0),
        .mem_write_safe   (1'b0),

        .pc_write_out     (pc_write_out),
        .reg_write_out    (reg_write_out),
        .mem_write_out    (mem_write_out)
    );
    
   // ----------------------------------------------------
    // Estimation layer (PASSIVE OBSERVATION ONLY)
    // ----------------------------------------------------
    estimation_top u_estimation_top (
        .clk(clk),
        .reset(reset),
    
        // tapped control signals (READ ONLY)
        .fsm_state(fsm_state),
        .pc_write(pc_write_out),
        .recovery_active(recovery_active),
    
        // estimation outputs (NOT USED anywhere)
        .power_estimate(est_power),
        .recovery_overhead_pct(est_perf_overhead)
    );

endmodule

