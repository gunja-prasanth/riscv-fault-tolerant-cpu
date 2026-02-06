`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 10:44:00
// Design Name: 
// Module Name: fault_detector
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
module fault_detector (
    input  wire [6:0] opcode,
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire        reg_write,
    output reg         fault_detected
);

    
    wire valid_opcode;

    assign valid_opcode =
           (opcode == 7'b0110011) || // R-type
           (opcode == 7'b0000011) || // Load
           (opcode == 7'b0100011) || // Store
           (opcode == 7'b1100011);   // Branch

    always @(*) begin
        fault_detected = 0;

        // Fault 1: Invalid opcode
        if (!valid_opcode)
            fault_detected = 1;

        // Fault 2: Illegal control combination
        else if (mem_read && mem_write)
            fault_detected = 1;

        // Fault 3: Valid opcode but no action
        else if (valid_opcode && !(reg_write || mem_read || mem_write))
            fault_detected = 1;
    end

endmodule


