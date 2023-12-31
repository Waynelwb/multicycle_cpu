`timescale 1ns / 1ps

module PC(clk, i_pc, pcWre, reset, outside_pc, o_pc);
    input wire clk, pcWre, reset;
    input wire [31:0] i_pc, outside_pc;
    output reg [31:0] o_pc;
    always @(pcWre or reset) begin
        // reset
        if (reset) begin
            o_pc = outside_pc;
        end 
        else if (pcWre) begin
            o_pc = i_pc;
        end 
        else if (!pcWre) begin 
            o_pc = o_pc;
        end
    end
endmodule
