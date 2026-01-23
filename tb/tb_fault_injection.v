`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2026 17:14:02
// Design Name: 
// Module Name: tb_fault_injection
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


module tb_fault_injection;

    reg  [6:0] opcode;
    reg        reg_write;
    reg        mem_read;
    reg        mem_write;

    wire fault_detected;

    
    fault_detector dut (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .fault_detected(fault_detected)
    );

    initial begin
        // Case 1: Valid instruction
        opcode    = 7'b0110011; // R-type
        reg_write = 1;
        mem_read  = 0;
        mem_write = 0;
        #10;

        // Case 2: Invalid opcode
        opcode    = 7'b1111111; 
        reg_write = 0;
        mem_read  = 0;
        mem_write = 0;
        #10;

        // Case 3: Illegal control
        opcode    = 7'b0000011; // Load
        reg_write = 1;
        mem_read  = 1;
        mem_write = 1;        
        #10;

        // Case 4: Forced fault
        force mem_write = 1;
        force mem_read  = 1;
        #10;
        release mem_write;
        release mem_read;

        #10;
        $finish;
    end

endmodule

