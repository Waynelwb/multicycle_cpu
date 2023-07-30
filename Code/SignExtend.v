`timescale 1ns / 1ps    
module SignExtend(i_num, ExtSel, o_num);
    input [15:0] i_num;
    input [1:0] ExtSel;
    output reg[31:0] o_num;
    initial begin
        o_num = 0;
    end
    always @(i_num or ExtSel) begin
        case(ExtSel)
            2'b00: o_num <= {{27'o000000000}, i_num[10:6]};
            2'b01: o_num <= {{16'h0000}, i_num[15:0]};
            2'b10: o_num <= {{16{i_num[15]}}, i_num[15:0]};
            default: o_num <= {{16{i_num[15]}}, i_num[15:0]}; 
        endcase
    end
endmodule
