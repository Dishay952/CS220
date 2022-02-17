`timescale 1ns/1ns
`include "odd_parity.v"
module odd_parity_tb;
  // Ports
  wire p;
  reg ip,clk,reset;
  reg [2:0] curr_state;
  wire [2:0] next_state;
  odd_parity uut(clk,reset,ip,p);
  initial begin
      clk=1'b0;
      #5;
      $monitor($time," Clock=%b Reset=%b Input=%b Output=%b ",clk,reset,ip,p);
      #15 $finish;
    end
    integer i;
  initial begin
    reset=1'b0;
    #5;
    ip=1'b0;
    #5 
    ip=1'b0;
    #5 
    ip=1'b0; ///000 should give parity bit output as one?
    // #5 ip=1'b0;
    // #5 ip=1'b1;
    // #5 ip=1'b0;
    // #5 ip=1'b1;
    // #5 ip=1'b0;
    // #5 ip=1'b1;
    // #5 ip=1'b1;
    // #5 ip=1'b0;
    // #5 ip=1'b0;
    // #5 ip=1'b1;
    // #5 reset=1'b1;
    // #5 ip=1'b0;
    // #5 ip=1'b1;
    // #5 ip=1'b0;
    end
  always
     #5 clk= ~clk ;

endmodule
