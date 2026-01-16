`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 17:16:57
// Design Name: 
// Module Name: tb_control_unit
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


module tb_control_unit;

    reg  [6:0] opcode;

    wire reg_write;
    wire mem_read;
    wire mem_write;
    wire [2:0] alu_op;

    control_unit uut (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_op(alu_op)
    );

    initial begin
      
        opcode = 7'b0110011;
        #10;

    
        opcode = 7'b0000011;
        #10;

      
        opcode = 7'b0100011;
        #10;

        
        opcode = 7'b1100011;
        #10;

        $finish;
    end

endmodule
