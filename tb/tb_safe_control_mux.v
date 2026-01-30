`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 18:13:00
// Design Name: 
// Module Name: tb_safe_control_mux
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


module tb_safe_control_mux;

    reg safe_mode;

    reg pc_write_normal;
    reg reg_write_normal;
    reg mem_write_normal;

    reg pc_write_safe;
    reg reg_write_safe;
    reg mem_write_safe;

    wire pc_write_out;
    wire reg_write_out;
    wire mem_write_out;

    safe_control_mux dut (
        .safe_mode(safe_mode),
        .pc_write_normal(pc_write_normal),
        .reg_write_normal(reg_write_normal),
        .mem_write_normal(mem_write_normal),
        .pc_write_safe(pc_write_safe),
        .reg_write_safe(reg_write_safe),
        .mem_write_safe(mem_write_safe),
        .pc_write_out(pc_write_out),
        .reg_write_out(reg_write_out),
        .mem_write_out(mem_write_out)
    );

    initial begin
        safe_mode = 0;
        pc_write_normal  = 1;
        reg_write_normal = 1;
        mem_write_normal = 1;

        pc_write_safe  = 0;
        reg_write_safe = 0;
        mem_write_safe = 0;

        #10;

        safe_mode = 1;

        #10;

        safe_mode = 0;

        #10;

        $finish;
    end

endmodule

