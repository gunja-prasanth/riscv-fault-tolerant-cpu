`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 10:46:32
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder (
    input  wire [31:0] instr,

    output wire is_add,
    output wire is_load,
    output wire is_store,
    output wire is_branch
);

    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;

    assign opcode = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

   
    assign is_add =
        (opcode == 7'b0110011) &&
        (funct3 == 3'b000) &&
        (funct7 == 7'b0000000);

    
    assign is_load =
        (opcode == 7'b0000011);

    
    assign is_store =
        (opcode == 7'b0100011);

  
    assign is_branch =
        (opcode == 7'b1100011);

endmodule

