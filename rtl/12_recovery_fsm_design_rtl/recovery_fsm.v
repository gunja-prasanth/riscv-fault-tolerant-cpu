`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 17:56:25
// Design Name: 
// Module Name: recovery_fsm
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


module recovery_fsm (
    input  wire clk,
    input  wire reset,

    input  wire minor_fault,
    input  wire critical_fault,
    input  wire recovery_done,

    output reg  freeze_cpu,
    output reg  recover_cpu,
    output reg  resume_cpu
);

    
    parameter NORMAL  = 2'b00;
    parameter FREEZE  = 2'b01;
    parameter RECOVER = 2'b10;
    parameter RESUME  = 2'b11;

    reg [1:0] current_state;
    reg [1:0] next_state;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= NORMAL;
        else
            current_state <= next_state;
    end

  
    always @(*) begin
        
        next_state = current_state;

        case (current_state)
            NORMAL: begin
                if (minor_fault || critical_fault)
                    next_state = FREEZE;
            end

            FREEZE: begin
                next_state = RECOVER;
            end

            RECOVER: begin
                if (recovery_done)
                    next_state = RESUME;
            end

            RESUME: begin
                next_state = NORMAL;
            end

            default: begin
                next_state = NORMAL;
            end
        endcase
    end

   
    always @(*) begin
        
        freeze_cpu  = 1'b0;
        recover_cpu = 1'b0;
        resume_cpu  = 1'b0;

        case (current_state)
            FREEZE:  freeze_cpu  = 1'b1;
            RECOVER: recover_cpu = 1'b1;
            RESUME:  resume_cpu  = 1'b1;
            default: ; 
        endcase
    end

endmodule

