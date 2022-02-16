`timescale 1ns/1ns
`include "Q1.v"
module Q1_tb;

  // Ports
  wire op;
  reg ip,clk,reset;
  Q1 uut(op,ip,reset,clk);

  initial begin
      clk=1'b0;
      $monitor($time," Reset =%b Current Input=%b Output=%b",reset,ip,op);
      #100 $finish;
    end

  initial begin
    reset=1'b0;
    #5 ip=1'b0;
    #5 ip=1'b0;
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
    #5   clk = ~  clk ;

endmodule;
