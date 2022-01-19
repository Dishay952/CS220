`timescale 1ns/1ns
`include "PEn_8_3.v"
module PEn_8_3_tb;
reg [7:0] D;
wire [2:0] Y;
PEn_8_3 uut(D,Y);
initial begin
    D=8'b01110000;
    #5;
    $display("Y=%b%b%b",Y[2],Y[1],Y[0]);
    D=8'b10000001;
    #5;
    $display("Y=%b%b%b",Y[2],Y[1],Y[0]);
    D=8'b11000000;
    #5;
    $display("Y=%b%b%b",Y[2],Y[1],Y[0]);
    D=8'b10101010;
    #5;
    $display("Y=%b%b%b",Y[2],Y[1],Y[0]);
    D=8'b10101000;
    #5;
    $display("Y=%b%b%b",Y[2],Y[1],Y[0]);
end
endmodule