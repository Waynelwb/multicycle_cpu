`timescale 1ns / 1ps

module InstructionMEM (addr, InsMemRW, instruction);
    input InsMemRW;
    input [31:0] addr;
    output reg [31:0] instruction;
    reg [7:0] mem [0:127];
    initial begin
        $readmemb("E:\\Courses\\Computer_Organization\\MultiCycleCPU\\MultiCycleCPU\\Code\\instructions.txt", mem);
        instruction = 0;
    end
    always @(addr or InsMemRW) begin
        if (InsMemRW) begin
            instruction[31:24] = mem[addr];
            instruction[23:16] = mem[addr+1];
            instruction[15:8] = mem[addr+2];
            instruction[7:0] = mem[addr+3];
        end
    end

endmodule
