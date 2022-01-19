`timescale 1ns/1ns
`include "three_to_eight.v"

module three_to_eight_tb;
reg enable,A0,A1,A2;
integer i;
wire Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0;
three_to_eight uut(A2,A1,A0,enable,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
initial begin
    $dumpfile("three_to_eight_tb.vcd");
    $dumpvars(0, three_to_eight_tb);
    A0<=1'b0;
    A1<=1'b0;
    A2<=1'b0;
    enable<=1'b0;
    $monitor("Enable=%0b A2=%0b A1=%0b A0=%0b Y7=%0b Y6=%0b Y5=%0b Y4=%0b Y3=%0b Y2=%0b Y1=%0b Y0=%0b",enable, A2,A1,A0,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
    for(i=0;i<16;i=i+1) begin
        #10 {enable,A2,A1,A0}=i;
    end
    #170 $display("Test complete");
end

endmodule 