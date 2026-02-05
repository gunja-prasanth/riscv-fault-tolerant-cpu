`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 22:52:20
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory (
    input  wire        clk,
    input  wire        reset,
    input  wire [31:0] pc,
    output reg  [31:0] instruction
);

   
    reg [31:0] rom [0:15];

    initial begin
        rom[0] = 32'h00000013; 
        rom[1] = 32'h00100093;
        rom[2] = 32'h00200113;
        rom[3] = 32'h00308193;
        rom[4] = 32'h00000013;
    end

    always @(posedge clk) begin
        if (reset)
            instruction <= 32'h00000013;
        else
            instruction <= rom[pc[5:2]]; 
    end

endmodule
