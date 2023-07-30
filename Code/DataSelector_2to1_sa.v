`timescale 1ns / 1ps

module DataSelector_2to1_sa(A, B, Control, Result);
    input [31:0] A;
    input [4:0] B;
    input Control;
    output [31:0] Result;
    
    assign Result = (Control == 1'b0 ? A : {{27'o000000000}, B[4:0]});

endmodule
