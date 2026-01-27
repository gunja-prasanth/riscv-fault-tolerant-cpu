`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 18:01:42
// Design Name: 
// Module Name: tb_recovery_fsm
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



module tb_recovery_fsm;

    reg clk;
    reg reset;
    reg minor_fault;
    reg critical_fault;
    reg recovery_done;

    wire freeze_cpu;
    wire recover_cpu;
    wire resume_cpu;

    recovery_fsm dut (
        .clk(clk),
        .reset(reset),
        .minor_fault(minor_fault),
        .critical_fault(critical_fault),
        .recovery_done(recovery_done),
        .freeze_cpu(freeze_cpu),
        .recover_cpu(recover_cpu),
        .resume_cpu(resume_cpu)
    );

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        minor_fault = 0;
        critical_fault = 0;
        recovery_done = 0;

        #10;
        reset = 0;

        #10;
        minor_fault = 1;
        #10;
        minor_fault = 0;

        #20;

        recovery_done = 1;
        #10;
        recovery_done = 0;

        #20;

        critical_fault = 1;
        #10;
        critical_fault = 0;

        #20;

        recovery_done = 1;
        #10;
        recovery_done = 0;
        
        #20;

       
        $finish;
    end

endmodule

