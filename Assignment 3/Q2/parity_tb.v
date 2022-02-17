`timescale 1ns/1ns
`include "odd_parity.v"
module odd_parity_tb;
  // Ports
  wire p;
  reg ip,clk,reset;
  odd_parity uut(clk,reset,ip,p);
  initial begin
      clk=1'b0;
      #1;
      $monitor($time," Input=%b Output=%b ",ip,p);
      #15 $finish;
    end
    integer i;
  initial begin
    reset=1'b0;
    #1 ip=1'b0;
    #1 ip=1'b0;
    #1 ip=1'b1; //000 should give parity bit output as one
    #1 ip=1'b1;
    #1 ip=1'b1;
    #1 ip=1'b0;//110 should give parity bit output as one
    #1 ip=1'b1;
    #1 ip=1'b0;
    #1 ip=1'b1;//101 should give parity bit output as one
    #1 ip=1'b0;
    #1 ip=1'b1;
    #1 ip=1'b1;//011 should give parity bit output as one
    // #1 ip=1'b1;
    #1 reset=1'b1;
    #1 ip=1'b0;
    #1 ip=1'b1;
    #1 ip=1'b0;
    end
  always
     #1 clk= ~clk ;
endmodule
