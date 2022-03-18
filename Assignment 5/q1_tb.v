`timescale 1ns/1ns
`include "q1.v"
module gcd_tb;
reg [7:0] a;
reg [7:0] b;
wire [7:0] ans;
integer i;
gcd uut(ans,a,b);
initial begin
  #5 a=4;
  #5 a=5;
  #5 a=8;
  #5 a=14;
  #5 a=67;
  #5 a=144;
  #5 a=35;
  #5 a=70;
  #5 a=40;
  #5 a=16;
  #5 a=20;
  #5 a=10;
  #5 a=45;
  #5 a=18;
  #5 a=27;
end
initial begin 
  #5 b=3;
  #5 b=15;
  #5 b=12;
  #5 b=43;
  #5 b=18;
  #5 b=60;
  #5 b=14;
  #5 b=45;
  #5 b=24;
  #5 b=18;
  #5 b=87;
  #5 b=15;
  #5 b=60;
  #5 b=54;
  #5 b=45;
end
initial begin
  $monitor("A=%d B=%d GCD=%d",a,b,ans);
  #180 $finish;
end
endmodule
