`include "ParityTry.v"
`timescale 1ns/1ns
module odd_parity_tb;

  reg clk = 0;
  reg reset = 0;
  reg  ip = 0;
  wire p;
  wire [2:0] INPUT;
  odd_parity uut (clk,reset,ip,p,INPUT);
    initial begin
        clk=1'b0;
        #5;
        $monitor($time," Clock=%b Input=%b Output=%b",clk,ip,p);
        #85 $finish;
      end
    initial begin
      reset=1'b0;
      ip=1'b0;
      #5 ip=1'b0;
      #5 ip=1'b0;
      #5 ip=1'b1; //001 should give parity bit output as zero
      #5 ip=1'b1;
      #5 ip=1'b1;
      #5 ip=1'b0;//110 should give parity bit output as one
      #5 ip=1'b1;
      #5 ip=1'b0;
      #5 ip=1'b1;//101 should give parity bit output as one
      #5 ip=1'b0;
      #5 ip=1'b1;
      #5 ip=1'b1;//011 should give parity bit output as one
      #5 ip=1'b1;
      // #5 reset=1'b1;
      #5 ip=1'b0;
      #5 ip=1'b1;
      #5 ip=1'b0;
      end
    always
       #5 clk= ~clk ;
endmodule
