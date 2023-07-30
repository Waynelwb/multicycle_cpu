`timescale 1ns / 1ps

module RegFile (rs, rt, rd, i_data, RegWre, clk, o_data_1, o_data_2);
    input [4:0] rs, rt, rd;
    input [31:0] i_data;
    input RegWre, clk;
    output [31:0] o_data_1, o_data_2;
    reg [31:0] register [0:31];

    integer i;
    initial begin
        i = 1;
        register[0]=0;
        while (i<32) begin
            register[i]=1;
            i = i+1;
        end
    end

    assign o_data_1 = register[rs];
    assign o_data_2 = register[rt];

    always @(i_data or rd) begin
        if ((rd != 0) && (RegWre == 1)) begin
            register[rd] = i_data;
        end
    end

endmodule