`timescale 1ns/1ns
`include  "RCA_8.v"
module RCA_8_tb;
reg [7:0] A;
reg [7:0] B;
reg C_in=1'b0;
wire [7:0] S;
wire C_out;
RCA_8 uut(C_out,S,A,B,C_in);
initial begin
    $dumpfile("RCA_8_tb.vcd");
    $dumpvars(0, RCA_8_tb);

    A<=8'b00000001;
    B<=8'b00000000;
    #5;
    $display("A=%b, B=%b, Carry=%b, Sum=%b",A,B,C_out,S);

    A<=8'b00000011;
    B<=8'b00000001;
    #5;
    $display("A=%b, B=%b, Carry=%b, Sum=%b",A,B,C_out,S);


end
endmodule