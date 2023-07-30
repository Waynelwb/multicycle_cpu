`timescale 1ns / 1ps 

module cpu_tb;
    // Inputs
    reg CLK;
    reg RST;
    reg [31:0] outside_pc;

    // Outputs
    wire [31:0] ins, now_pc;
    wire [31:0] operand1;
    wire [31:0] operand2;
    wire [31:0] result;

    // Instantiate the Unit Under Test (UUT)
    Main uut (
        .CLK(CLK), 
        .RST(RST), 
        .outside_pc(outside_pc), 
        .ins(ins),
        .now_pc(now_pc),
        .operand1(operand1),
        .operand2(operand2),
        .result(result)
    );

    initial begin
        CLK = 0;
        RST = 1;
        outside_pc = 0;
        #50;
        CLK = !CLK;
        #50;
        RST = 0;
        forever #50 begin 
            CLK = !CLK;
        end
    end

 endmodule