`timescale 1ns / 1ps    

module PCAddImm(now_pc, imm, o_pc);
    input [31:0] now_pc, imm;
    output [31:0] o_pc;

    assign o_pc = now_pc + (imm << 2);
    
endmodule
