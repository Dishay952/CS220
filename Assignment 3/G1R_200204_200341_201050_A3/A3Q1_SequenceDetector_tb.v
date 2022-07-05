`timescale 1ns/1ns
`include "A3Q1_SequenceDetector.v"
module SequenceDetector_tb;

  // Ports
  wire op;
  reg ip,clk,reset;
  SequenceDetector uut(op,ip,reset,clk);

  initial begin
      clk=1'b1;
      $monitor($time," Clock=%b Reset=%b Current Input=%b Output=%b",clk,reset,ip,op);
      #100 $finish;
    end

  initial begin
    reset=1'b0;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 ip=1'b1;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 ip=1'b1;
    #5 ip=1'b0;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 reset=1'b1;
    #5 ip=1'b0;
    #5 ip=1'b1;
    #5 ip=1'b0;
    end
  always
    #5  clk = ~  clk ;
endmodule;
