`timescale 1ns / 1ps

module DataSelector_3to1(A, B, C, Control, Result);
    input [4:0] A, B, C;
    input [1:0] Control;
    output reg[4:0] Result;
    
    always @(Control or A or B or C) begin
        case(Control)
            2'b00:Result = A;
            2'b01:Result = B;
            2'b10:Result = C;
            default: Result = 0;
        endcase
    end

endmodule
