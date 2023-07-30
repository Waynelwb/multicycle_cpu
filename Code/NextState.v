`timescale 1ns / 1ps
module NextState(i_state, opcode, next_state);
    input [2:0]i_state;
    input [5:0]opcode;
    output reg[2:0]next_state;
    parameter [2:0] IF = 3'b000, 
                    ID = 3'b001, 
                    aEXE = 3'b110, 
                    bEXE = 3'b101, 
                    cEXE = 3'b010, 
                    MEM = 3'b011, 
                    aWB = 3'b111, 
                    cWB = 3'b100; 
    always @(i_state or opcode) begin
        case (i_state)
            IF: next_state = ID;
            ID: begin
                case (opcode[5:3])
                    3'b110: begin
                        if (opcode == 6'b110100) next_state = bEXE; 
                        else next_state = cEXE; 
                    end
                    3'b111: next_state = IF; 
                    default: next_state = aEXE; 
                endcase
            end
            aEXE: next_state = aWB;
            bEXE: next_state = IF;
            cEXE: next_state = MEM;
            MEM: begin
                if (opcode == 6'b110001) next_state = cWB; 
                else next_state = IF; 
            end
            aWB: next_state = IF;
            cWB: next_state = IF;
            default: next_state = IF;
        endcase
    end
endmodule
