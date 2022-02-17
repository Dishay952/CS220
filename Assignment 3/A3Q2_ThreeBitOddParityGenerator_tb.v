`include "A3Q2_ThreeBitOddParityGenerator.v"
`timescale 1ns/1ns
module ThreeBitOddParityGenerator_tb;

  reg clk = 0;
  reg reset = 0;
  reg  ip = 0;
  wire p;
  ThreeBitOddParityGenerator uut (clk,reset,ip,p);
    initial begin
        clk=1'b0;
        #5;
        $monitor($time," Clock=%b Input=%b Output=%b",clk,ip,p);
        #120 $finish;
      end
    initial begin
      reset=1'b0;
      ip=1'b0;
      #5 ip=1'b0;
      #5 ip=1'b0;
      #5 ip=1'b0;

      #5 ip=1'b0;
      #5 ip=1'b0;
      #5 ip=1'b1;

      #5 ip=1'b0;
      #5 ip=1'b1;
      #5 ip=1'b0;

      #5 ip=1'b0;
      #5 ip=1'b1;
      #5 ip=1'b1;

      #5 ip=1'b1;
      #5 ip=1'b0;
      #5 ip=1'b0;

      #5 ip=1'b1;
      #5 ip=1'b0;
      #5 ip=1'b1; 

      #5 ip=1'b1;
      #5 ip=1'b1;
      #5 ip=1'b0;

      #5 ip=1'b1;
      #5 ip=1'b1;
      #5 ip=1'b1;

    
      end
    always
       #5 clk= ~clk ;
endmodule
