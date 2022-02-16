`include "parity.v"
`timescale 1ps/1ps

module parity_tb;
reg [3:0] A;
wire p;
parity uut(A,p);
initial begin
$dumpfile("parity_tb.vcd");
$dumpvars(0,parity_tb);
    #5;
  $monitor("t=%t p=%b a=%b b=%b c=%b",$time,p,A[0],A[1],A[2]);
end
integer i;
initial begin
    for (i=0; i<8; i=i+1) begin
        #5 A<=i;
    end
end
endmodule