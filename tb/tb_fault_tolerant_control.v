`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2026 19:33:46
// Design Name: 
// Module Name: tb_fault_tolerant_control
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


module tb_fault_tolerant_control;

    reg clk;
    reg reset;

   
    reg illegal_opcode;
    reg invalid_control;
    reg stuck_at_fault;

   
    reg pc_write_normal;
    reg reg_write_normal;
    reg mem_write_normal;

    reg [31:0] pc_current;
    reg [31:0] pc_saved;

    wire pc_write_out;
    wire reg_write_out;
    wire mem_write_out;

    wire [31:0] pc_next;
    wire insert_nop;
    wire retry_en;

    fault_tolerant_control dut (
        .clk(clk),
        .reset(reset),

        .illegal_opcode(illegal_opcode),
        .invalid_control(invalid_control),
        .stuck_at_fault(stuck_at_fault),

        .pc_write_normal(pc_write_normal),
        .reg_write_normal(reg_write_normal),
        .mem_write_normal(mem_write_normal),

        .pc_current(pc_current),
        .pc_saved(pc_saved),

        .pc_write_out(pc_write_out),
        .reg_write_out(reg_write_out),
        .mem_write_out(mem_write_out),

        .pc_next(pc_next),
        .insert_nop(insert_nop),
        .retry_en(retry_en)
    );

    always #5 clk = ~clk;
   
    initial begin
        clk = 0;
        reset = 1;

        illegal_opcode  = 0;
        invalid_control = 0;
        stuck_at_fault  = 0;

        pc_write_normal  = 1;
        reg_write_normal = 1;
        mem_write_normal = 1;

        pc_current = 32'h00000010;
        pc_saved   = 32'h00000008;

        #10;
        reset = 0;

        #20;

        illegal_opcode = 1;
        #20;
        illegal_opcode = 0;

        #40;

        stuck_at_fault = 1;
        #20;
        stuck_at_fault = 0;

        #50;
        $finish;
    end

endmodule
