`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 13:10:17
// Design Name: 
// Module Name: tb_pc_control
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


module tb_pc_control;

    reg clk;
    reg reset;
    reg pc_hold;
    reg pc_redirect;
    reg [31:0] redirect_addr;

    wire [31:0] pc;

    pc_control uut (
        .clk(clk),
        .reset(reset),
        .pc_hold(pc_hold),
        .pc_redirect(pc_redirect),
        .redirect_addr(redirect_addr),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        pc_hold = 0;
        pc_redirect = 0;
        redirect_addr = 32'h20;

        #10 reset = 0;          
        #20 pc_hold = 1;        
        #20 pc_hold = 0;        
        #20 pc_redirect = 1;    
        #10 pc_redirect = 0;

        #20 $finish;
    end

endmodule

