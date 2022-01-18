`timescale 1ns/1ns
`include "two_to_four.v"

module two_to_four_tb;
reg enable, A0, A1;
integer i;
wire Y3,Y2,Y1,Y0;
two_to_four uut(A1,A0,enable,Y3,Y2,Y1,Y0);
initial begin
    $dumpfile("two_to_four_tb.vcd");
    $dumpvars(0, two_to_four_tb);
    A0<=1'b0;
    A1<=1'b0;
    enable<=1;
    $monitor("A1=%0b A0=%0b Enable=%0b Y3=%0b Y2=%0b Y1=%0b Y0=%0b", A1,A0,enable,Y3,Y2,Y1,Y0);
    #2000 $display("Test complete");
end

initial begin
    //enable=1;
    A0=0; A1=0;
    #100 A0=1;A1=0;
    #200 A0=0;A1=1;
    #300 A0=1;A1=1;
end
endmodule 