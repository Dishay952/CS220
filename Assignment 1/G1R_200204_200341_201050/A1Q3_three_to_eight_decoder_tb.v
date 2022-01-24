`timescale 1ns/1ns
`include "A1Q3_three_to_eight_decoder.v"

module three_to_eight_decoder_tb;
reg enable,A0,A1,A2;
integer i;
wire Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0;
three_to_eight_decoder uut(A2,A1,A0,enable,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
initial begin
    $dumpfile("A1Q3_three_to_eight_decoder_tb.vcd");
    $dumpvars(0, three_to_eight_decoder_tb);
    A0<=1'b0;
    A1<=1'b0;
    A2<=1'b0;
    enable<=1'b0;
    #5;
    $monitor("%t Enable=%0b A2=%0b A1=%0b A0=%0b Y7=%0b Y6=%0b Y5=%0b Y4=%0b Y3=%0b Y2=%0b Y1=%0b Y0=%0b",$time,enable, A2,A1,A0,Y7,Y6,Y5,Y4,Y3,Y2,Y1,Y0);
    for(i=0;i<16;i=i+1) begin
        #5 {enable,A2,A1,A0}=i;
    end
    #85 $display("Test complete");
end

endmodule 