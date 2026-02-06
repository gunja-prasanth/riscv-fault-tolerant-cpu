`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 11:07:19
// Design Name: 
// Module Name: fault_classifier
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


module fault_classifier (
    input  wire illegal_opcode,
    input  wire invalid_control,
    input  wire stuck_at_fault,
    output reg  [1:0] fault_type
);

always @(*) begin
    if (stuck_at_fault) begin
        fault_type = 2'b10; // CRITICAL
    end
    else if (illegal_opcode || invalid_control) begin
        fault_type = 2'b01; // MINOR
    end
    else begin
        fault_type = 2'b00; // NO FAULT
    end
end

endmodule
