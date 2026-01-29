`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2026 17:50:36
// Design Name: 
// Module Name: recovery_action
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


module recovery_action (
    input  wire recovery_en,

    input  wire [31:0] pc_current,
    input  wire [31:0] pc_saved,

    output reg  [31:0] pc_next,
    output reg         insert_nop,
    output reg         retry_en
);

    always @(*) begin
        pc_next    = pc_current;
        insert_nop = 1'b0;
        retry_en   = 1'b0;

        if (recovery_en) begin
            pc_next    = pc_saved; 
            insert_nop = 1'b1;     
            retry_en   = 1'b1;     
        end
    end

endmodule
