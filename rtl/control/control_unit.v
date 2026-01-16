`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 17:10:43
// Design Name: 
// Module Name: control_unit
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


module control_unit (
    input  wire [6:0] opcode,

    output reg        reg_write,
    output reg        mem_read,
    output reg        mem_write,
    output reg [2:0]  alu_op
);

   
    always @(*) begin
       
        reg_write = 0;
        mem_read  = 0;
        mem_write = 0;
        alu_op    = 3'b000;

        case (opcode)

            
            7'b0110011: begin
                reg_write = 1;
                alu_op    = 3'b010;
            end

            
            7'b0000011: begin
                reg_write = 1;
                mem_read  = 1;
                alu_op    = 3'b000;
            end

           
            7'b0100011: begin
                mem_write = 1;
                alu_op    = 3'b000;
            end

            
            7'b1100011: begin
                alu_op = 3'b001;
            end

            default: begin
               
            end
        endcase
    end

endmodule
