`timescale 1ns/1ns
`include "PEn_8_3.v"
module PEn_8_3_tb;
reg [7:0] D;
wire [2:0] Y;
PEn_8_3 uut(D,Y);
initial begin
    #5;
    $monitor("%t D=%b Y=%b",$time,D,Y);
end
initial begin
    #5 D=8'b00000001;
    #5 D=8'b00000010;
    #5 D=8'b00000011;
    #5 D=8'b00000100;
    #5 D=8'b00010000;
end
endmodule