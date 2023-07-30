`timescale 1ns / 1ps

module DataSelector_2to1(A, B, Control, Result);
    input [31:0] A, B;
    input Control;
    output [31:0] Result;
    
    assign Result = (Control == 1'b0 ? A : B);

endmodule
