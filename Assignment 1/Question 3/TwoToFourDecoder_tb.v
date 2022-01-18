`timescale 1ns / 1ns
`include "TwoToFourDecoder.v"

module TwoToFourDecoder_tb;
wire enable, A0, A1;
integer i;
wire Y3,Y2,Y1,Y0;
TwoToFourDecoder_tb uut(A1,A0,enable,Y3,Y2,Y1,Y0);
initial begin
    $dumpfile("TwoToFourDecoder_tb.vcd");
    $dumpvars(0, TwoToFourDecoder_tb);
    //ABCD two_to_four(A1,A0,enable,Y3,Y2,Y1,Y0);
    A0<=0;
    A1<=0;
    enable<=0;
    $monitor("A1=%0b A0=%0b Enable=%0b Y3=%0b Y2=%0b Y1=%0b Y0=%0b", A1,A0,enable,Y3,Y2,Y1,Y0);
    for(i=0;i<8;i=i+1) begin
        {enable,A1,A0}=i;
    end
    $display("Test complete");
end

endmodule 