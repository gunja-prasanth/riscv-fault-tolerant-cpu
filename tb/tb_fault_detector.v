`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 10:46:33
// Design Name: 
// Module Name: tb_fault_detector
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


module tb_fault_detector;

    reg  [6:0] opcode;
    reg        mem_read;
    reg        mem_write;
    reg        reg_write;

    wire fault_detected;

    fault_detector uut (
        .opcode(opcode),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .reg_write(reg_write),
        .fault_detected(fault_detected)
    );

    initial begin
        // Case 1: valid R-type (No Fault)
        opcode    = 7'b0110011;
        mem_read  = 0;
        mem_write = 0;
        reg_write = 1;
        #10;

        // Case 2: Invalid opcode (FAULT)
        opcode    = 7'b1111111;
        mem_read  = 0;
        mem_write = 0;
        reg_write = 0;
        #10;

        // Case 3: Illegal control (FAULT)
        opcode    = 7'b0000011;
        mem_read  = 1;
        mem_write = 1;
        reg_write = 0;
        #10;

        // Case 4: Valid opcode but no action (FAULT)
        opcode    = 7'b0100011;
        mem_read  = 0;
        mem_write = 0;
        reg_write = 0;
        #10;

        $finish;
    end

endmodule

