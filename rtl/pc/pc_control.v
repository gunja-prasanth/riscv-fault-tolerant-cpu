`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 13:06:05
// Design Name: 
// Module Name: pc_control
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


module pc_control (
    input  wire        clk,
    input  wire        reset,
    input  wire        pc_hold,
    input  wire        pc_redirect,
    input  wire [31:0] redirect_addr,

    output reg  [31:0] pc
);

    always @(posedge clk) begin
        if (reset)
            pc <= 32'b0;
        else if (pc_hold)
            pc <= pc;                 
        else if (pc_redirect)
            pc <= redirect_addr;      
        else
            pc <= pc + 4;            
    end

endmodule
