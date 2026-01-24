`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 11:10:53
// Design Name: 
// Module Name: tb_fault_classifier
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


module tb_fault_classifier;

reg illegal_opcode;
reg invalid_control;
reg stuck_at_fault;
wire [1:0] fault_type;

fault_classifier dut (
    .illegal_opcode(illegal_opcode),
    .invalid_control(invalid_control),
    .stuck_at_fault(stuck_at_fault),
    .fault_type(fault_type)
);

initial begin
    illegal_opcode = 0;
    invalid_control = 0;
    stuck_at_fault = 0;

    #10 illegal_opcode = 1;     // MINOR
    #10 illegal_opcode = 0;

    #10 invalid_control = 1;    // MINOR
    #10 invalid_control = 0;

    #10 stuck_at_fault = 1;     // CRITICAL
    #10 stuck_at_fault = 0;

    #10 $finish;
end

endmodule
