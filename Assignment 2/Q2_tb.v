`timescale 1ns/1ns
`include  "Q2.v"
module JohnsonCounter_tb;
  wire[7:0] q;
  reg clk;
  reg reset;
  integer i;
  JohnsonCounter uut(q,clk,reset);

  initial begin
      reset=1'b1;
      $monitor("%t q=%b, clock=%b, reset=%b",$time,q,clk,reset);
<<<<<<< Updated upstream
      #10 reset=1'b0;
      $monitor("%t q=%b, clock=%b, reset=%b",$time,q,clk,reset); 
      #180 reset=1'b1;
      $monitor("%t q=%b, clock=%b, reset=%b",$time,q,clk,reset); 
      
=======
      #165 $finish;
>>>>>>> Stashed changes
  end

  initial begin
    clk=1'b0;
    for(i=0;i<40;i=i+1) begin
      #5 clk=~clk;
    end
    #5 $finish;
  end

endmodule
