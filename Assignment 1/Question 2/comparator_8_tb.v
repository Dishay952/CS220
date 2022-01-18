`timescale 1ns/1ns
`include "comparator_8.v"
module comparator_8_tb;
reg [7:0] A;
reg [7:0] B;
wire e,g,l;
comparator_8 c(A,B,e,g,l);
initial begin
    A=8'b00000001;
    B=8'b00010000;
    #5;
    $display("A=%b, B=%b, E=%b, G=%b, L=%b",A,B,e,g,l);
    A=8'b00000001;
    B=8'b00000001;
    #5;
    $display("A=%b, B=%b, E=%b, G=%b, L=%b",A,B,e,g,l);

end
endmodule
