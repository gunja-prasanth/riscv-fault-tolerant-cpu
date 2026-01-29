`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2026 17:52:50
// Design Name: 
// Module Name: tb_recovery_action
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


`timescale 1ns / 1ps

module tb_recovery_action;

    reg recovery_en;
    reg [31:0] pc_current;
    reg [31:0] pc_saved;

    wire [31:0] pc_next;
    wire insert_nop;
    wire retry_en;

    recovery_action dut (
        .recovery_en(recovery_en),
        .pc_current(pc_current),
        .pc_saved(pc_saved),
        .pc_next(pc_next),
        .insert_nop(insert_nop),
        .retry_en(retry_en)
    );

    initial begin
        recovery_en = 0;
        pc_current  = 32'h00000010;
        pc_saved    = 32'h00000008;

        #10;
        
        recovery_en = 1;

        #10;

        recovery_en = 0;

        #10;

        $finish;
    end

endmodule
