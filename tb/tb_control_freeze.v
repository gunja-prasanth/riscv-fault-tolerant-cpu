`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 18:12:08
// Design Name: 
// Module Name: tb_control_freeze
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



module tb_control_freeze;

    reg freeze_en;
    reg pc_write_in;
    reg reg_write_in;
    reg mem_write_in;

    wire pc_write_out;
    wire reg_write_out;
    wire mem_write_out;

    control_freeze dut (
        .freeze_en(freeze_en),
        .pc_write_in(pc_write_in),
        .reg_write_in(reg_write_in),
        .mem_write_in(mem_write_in),
        .pc_write_out(pc_write_out),
        .reg_write_out(reg_write_out),
        .mem_write_out(mem_write_out)
    );

    initial begin
        freeze_en     = 0;
        pc_write_in  = 1;
        reg_write_in = 1;
        mem_write_in = 1;

        #10;

        freeze_en = 1;

        #10;

        freeze_en = 0;

        #10;

        $finish;
    end

endmodule

