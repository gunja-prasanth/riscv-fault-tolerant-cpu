`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 17:57:25
// Design Name: 
// Module Name: fault_tolerant_assertions
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


// -------------------------------------------------
// Module: fault_tolerant_assertions
// Purpose: Formal safety guarantees for control logic
// Day-19: Assertions added (no functional impact)
// -------------------------------------------------

module fault_tolerant_assertions (
    input logic clk,
    input logic reset,

    input logic safe_mode,

    input logic pc_write_out,
    input logic reg_write_out,
    input logic mem_write_out,

    input logic recover_cpu,
    input logic resume_cpu
);

    // ---------------------------------------------
    // Assertion 1:
    // No writes allowed during fault or recovery
    // ---------------------------------------------
    property no_write_during_fault;
        @(posedge clk)
        disable iff (reset)
        safe_mode |-> (!pc_write_out && !reg_write_out && !mem_write_out);
    endproperty

    assert_no_write_during_fault:
        assert property (no_write_during_fault)
        else $error("ASSERTION FAILED: Write occurred during safe_mode");

    // ---------------------------------------------
    // Assertion 2:
    // Recovery must eventually resume
    // ---------------------------------------------
    property eventually_resume;
        @(posedge clk)
        disable iff (reset)
        recover_cpu |-> ##[1:10] resume_cpu;
    endproperty

    assert_eventually_resume:
        assert property (eventually_resume)
        else $error("ASSERTION FAILED: Recovery did not resume");

endmodule

