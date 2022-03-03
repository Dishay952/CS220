`timescale 1ns/1ns
`include "ThreeBitGreyCounter.v"
module ThreeBitGreyCounter_tb;
  // reg reset;
  // reg out;
  wire [2:0] A;
  wire count;
  reg reset,clock;
  wire out;
  ThreeBitGreyCounter uut(clock,reset,out,A,count);
  always 
    #5 clock=~clock;
  initial begin
        clock=1'b0;
        #1;
        $monitor($time," Input=%b Count=%b Grey_code=%b Output=%b",reset,count,A,out);
        #120 $finish;
  end
    initial begin
      reset=1'b0;
      // A=3'b000;
      // count=0;
      end
endmodule
