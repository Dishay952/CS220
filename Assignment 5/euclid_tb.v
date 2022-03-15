`timescale 1ns/1ns
`include "euclid.v"
module gcd_tb;
reg [7:0] a;
reg [7:0] b;
wire [7:0] ans;
integer i;
reg clk;
gcd uut(ans,a,b,clk);
initial begin
  a<=6;
  b<=3;
  for(i=0;i<=15;i=i+1) begin
      #5 $display("A=%d B=%d GCD=%d",a,b,ans);
      a=a+1;
      b=b+1;
  end
end
initial begin
  #1 clk=~clk;
end
initial begin
  #180 $finish;
end
endmodule
