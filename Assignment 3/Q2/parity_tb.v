`timescale 1ns/1ns
`include "parity.v"
module odd_parity_tb;
  // Ports
  wire p;
  reg ip,clk,reset;
  odd_parity uut(clk,reset,ip,p);
  initial begin
      clk=1'b0;
      #5;
      $monitor($time," Clock=%b Input=%b Output=%b",clk,ip,p);
      #85 $finish;
    end
    integer i;
  initial begin
    reset=1'b0;
    #5 ip=1'b0;
    #5 ip=1'b0;
    #5 ip=1'b1; //000 should give parity bit output as one
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
