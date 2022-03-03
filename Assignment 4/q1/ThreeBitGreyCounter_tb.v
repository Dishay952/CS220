`timescale 1ns/1ns
`include "ThreeBitGreyCounter.v"
module ThreeBitGreyCounter_tb;
  reg reset = 0;
  wire out;
  ThreeBitGreyCounter uut (reset,out,A,count);
    initial begin
        $monitor($time,"Input=%b Count=%b Grey_code=%b Output=%b",reset,count,A,out);
        #120 $finish;
      end
    initial begin
      reset=1'b0;
      #40 reset=1'b1;
      #20 reset=1'b0;
      end
endmodule
