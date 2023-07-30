`timescale 1ns / 1ps

module OutputFunc(state, opcode, zero, PCWre, InsMemRW, IRWre, WrRegData, RegWre, ALUSrcA, ALUSrcB, DataMemRW, DBDataSrc, ExtSel, RegDst, PCSrc, ALUOp);
    input [2:0]state;
    input [5:0]opcode;
    input zero;
    output reg PCWre, InsMemRW, IRWre, WrRegData, RegWre, ALUSrcA, ALUSrcB, DataMemRW, DBDataSrc;
    output reg[1:0]ExtSel, RegDst, PCSrc;
    output reg[2:0]ALUOp;
    parameter [2:0] IF = 3'b000, 
                    ID = 3'b001, 
                    aEXE = 3'b110, 
                    bEXE = 3'b101, 
                    cEXE = 3'b010, 
                    MEM = 3'b011, 
                    aWB = 3'b111, 
                    cWB = 3'b100; 
    parameter [5:0] add = 6'b000000,
                    sub = 6'b000001,
                    sw = 6'b110000,
                    lw = 6'b110001,
                    beq = 6'b110100,
                    j = 6'b111000,
              	    Or = 6'b010000,
                    halt = 6'b111111;

    always @(state) begin
        if (state == IF && opcode != halt) PCWre = 1;
        else PCWre = 0;
        InsMemRW = 1;
        if (state == IF) IRWre = 1;
        else IRWre = 0;
        if (state == aWB || state == cWB) WrRegData = 1;
        else WrRegData = 0;
        if (state == aWB || state == cWB) RegWre = 1;
        else RegWre = 0;
	ALUSrcA = 0;
        if (opcode == sw || opcode == lw) ALUSrcB = 1;
        else ALUSrcB = 0;
        if (state == MEM && opcode == sw) DataMemRW = 1;
        else DataMemRW = 0;
        if (state == cWB) DBDataSrc = 1;
        else DBDataSrc = 0;
        ExtSel = 2'b10;
	if (opcode == lw) RegDst = 2'b01;
        else RegDst = 2'b10;
        case(opcode)
            j: PCSrc = 2'b11;
            beq: begin
                if (zero) PCSrc = 2'b01;
                else PCSrc = 2'b00;
            end
            default: PCSrc = 2'b00;
        endcase
        case(opcode)
            sub: ALUOp = 3'b001;
            Or: ALUOp = 3'b101;
            beq: ALUOp = 3'b001;
            default: ALUOp = 3'b000;
        endcase
        if (state == IF) begin
            RegWre = 0;
            DataMemRW = 0;
        end
    end

endmodule
