`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 09:12:25
// Design Name: 
// Module Name: tb_top_control_subsystem
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


module tb_top_control_subsystem;

    reg clk;
    reg rst;

    wire [31:0] pc;
    wire [31:0] instruction;
    wire [6:0]  opcode;
    wire [6:0]  funct7;
    wire        alu_add;
    wire        alu_sub;
    wire        valid_instr;

    top_control_subsystem DUT (
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .instruction(instruction),
        .opcode(opcode),
        .funct7(funct7),
        .alu_add(alu_add),
        .alu_sub(alu_sub),
        .valid_instr(valid_instr)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        $display("TIME | PC | INSTR     | OPCODE | FUNCT7  | ADD | SUB | VALID");
        $display("------------------------------------------------------------");

        #12 rst = 0;
    end

    always @(posedge clk) begin
        $display(
            "%4t | %2h | %8h | %7b | %7b |  %b  |  %b  |   %b",
            $time,
            pc,
            instruction,
            opcode,
            funct7,
            alu_add,
            alu_sub,
            valid_instr
        );
    end

    initial begin
        #60;
        $display("---- Simulation Finished ----");
        $finish;
    end

endmodule
