`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 23:01:20
// Design Name: 
// Module Name: tb_instruction_memory
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


`timescale 1ns/1ps

module tb_instruction_memory;

    
    reg         clk;
    reg         reset;
    reg [31:0]  pc;

    
    wire [31:0] instruction;

    
    instruction_memory dut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction)
    );

    
    always #5 clk = ~clk;

    initial begin
        
        clk   = 0;
        reset = 1;
        pc    = 32'b0;

        
        #10;
        reset = 0;

        
        #10 pc = 32'h00000000; 
        #10 pc = 32'h00000004; 
        #10 pc = 32'h00000008; 
        #10 pc = 32'h0000000C; 
        #10 pc = 32'h00000010; 

        
        #20;
        $finish;
    end

endmodule


