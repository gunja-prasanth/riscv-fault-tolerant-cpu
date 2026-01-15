`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 10:48:08
// Design Name: 
// Module Name: tb_instruction_decoder
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


module tb_instruction_decoder;

    reg  [31:0] instr;
    wire is_add, is_load, is_store, is_branch;

    instruction_decoder uut (
        .instr(instr),
        .is_add(is_add),
        .is_load(is_load),
        .is_store(is_store),
        .is_branch(is_branch)
    );

    initial begin
        
        instr = 32'h003081B3; 
        #10;

       
        instr = 32'h00002083; 
        #10;

       
        instr = 32'h00102023; 
        #10;

       
        instr = 32'h00000063; 
        #10;

        $finish;
    end

endmodule

