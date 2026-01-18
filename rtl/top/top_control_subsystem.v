`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 09:06:07
// Design Name: 
// Module Name: top_control_subsystem
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

module instruction_memory (
    input  wire [31:0] pc,
    output reg  [31:0] instruction
);

    always @(*) begin
        case (pc)
            32'h00000000: instruction = 32'h002081b3; // add
            32'h00000004: instruction = 32'h402081b3; // sub
            32'h00000008: instruction = 32'h00000013; // nop
            default:      instruction = 32'h00000013; // SAFE NOP
        endcase
    end

endmodule


module instruction_decoder (
    input  wire [31:0] instruction,
    output wire [6:0]  opcode,
    output wire [2:0]  funct3,
    output wire [6:0]  funct7,
    output wire [4:0]  rs1,
    output wire [4:0]  rs2,
    output wire [4:0]  rd
);

    assign opcode = instruction[6:0];
    assign rd     = instruction[11:7];
    assign funct3 = instruction[14:12];
    assign rs1    = instruction[19:15];
    assign rs2    = instruction[24:20];
    assign funct7 = instruction[31:25];

endmodule

module control_unit (
    input  wire [6:0] opcode,
    input  wire [6:0] funct7,
    output reg        alu_add,
    output reg        alu_sub,
    output reg        valid_instr
);

    always @(*) begin
        alu_add     = 1'b0;
        alu_sub     = 1'b0;
        valid_instr = 1'b0;

        if (opcode == 7'b0110011) begin // R-type
            valid_instr = 1'b1;
            if (funct7 == 7'b0000000)
                alu_add = 1'b1;
            else if (funct7 == 7'b0100000)
                alu_sub = 1'b1;
        end
    end

endmodule

module pc_control (
    input  wire        clk,
    input  wire        rst,
    output reg  [31:0] pc
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc <= 32'd0;
        else
            pc <= pc + 32'd4;
    end

endmodule

module top_control_subsystem (
    input  wire        clk,
    input  wire        rst,
    output wire [31:0] pc,
    output wire [31:0] instruction,
    output wire [6:0]  opcode,
    output wire [6:0]  funct7,
    output wire        alu_add,
    output wire        alu_sub,
    output wire        valid_instr
);

    wire [2:0] funct3;
    wire [4:0] rs1, rs2, rd;

    pc_control PC (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    instruction_memory IMEM (
        .pc(pc),
        .instruction(instruction)
    );

   instruction_decoder DEC (
        .instruction(instruction),
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd)
    );

    control_unit CTRL (
        .opcode(opcode),
        .funct7(funct7),
        .alu_add(alu_add),
        .alu_sub(alu_sub),
        .valid_instr(valid_instr)
    );

endmodule



