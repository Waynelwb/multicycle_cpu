`timescale 1ns / 1ps

module IR(i_data, clk, IRWre, o_data);
    input clk, IRWre;
    input [31:0] i_data;
    output reg[31:0] o_data;
    
    always @(negedge clk) begin 
        if (IRWre) begin
            o_data = i_data;
        end
    end

endmodule
