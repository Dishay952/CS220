`timescale 1ns/1ps
`include "two_to_four.v"

module two_to_four_tb;
reg enable, A0, A1;
integer i;
wire Y3,Y2,Y1,Y0;
two_to_four dut(A1,A0,enable,Y3,Y2,Y1,Y0);
initial begin
    $dumpfile("two_to_four_tb.vcd");
    $dumpvars(0, two_to_four_tb);
    enable<=1'b1;
    $monitor("%t A1=%0b A0=%0b Enable=%0b Y3=%0b Y2=%0b Y1=%0b Y0=%0b", $time,A1,A0,enable,Y3,Y2,Y1,Y0);
    #100 A0<=1'b0; A1<=1'b0;
    #2000 $display("Test complete");
end
endmodule 