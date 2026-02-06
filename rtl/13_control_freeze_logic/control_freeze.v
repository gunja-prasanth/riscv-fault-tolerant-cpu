`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 18:10:26
// Design Name: 
// Module Name: control_freeze
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


module control_freeze (
    input  wire freeze_en,

    input  wire pc_write_in,
    input  wire reg_write_in,
    input  wire mem_write_in,

    output wire pc_write_out,
    output wire reg_write_out,
    output wire mem_write_out
);

    assign pc_write_out  = freeze_en ? 1'b0 : pc_write_in;
    assign reg_write_out = freeze_en ? 1'b0 : reg_write_in;
    assign mem_write_out = freeze_en ? 1'b0 : mem_write_in;

endmodule

