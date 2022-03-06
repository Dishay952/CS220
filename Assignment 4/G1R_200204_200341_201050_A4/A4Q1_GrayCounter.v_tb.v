`timescale 1ns/1ns
`include "A4Q1_ThreeBitGreyCounter.v"
module ThreeBitGreyCounter_tb;
  // reg reset;
  // reg out;
  wire [2:0] A;
  wire [2:0] count;
  reg reset,clock;
  wire out;
  ThreeBitGreyCounter uut(clock,reset,out,A,count);
  always 
    #5 clock=~clock;
  initial begin
        clock=1'b0;
        #5;
        $monitor($time," Input=%b Count=%d Grey_code=%b Output=%b",reset,count,A,out);
        #180 $finish;
  end
    initial begin
      reset=1'b0;
      // A=3'b000;
      // count=0;
      end
endmodule
