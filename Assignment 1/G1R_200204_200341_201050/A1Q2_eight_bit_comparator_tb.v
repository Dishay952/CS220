`timescale 1ns/1ns
`include "A1Q2_eight_bit_comparator.v"

module A1Q2_eight_bit_comparator_tb;
reg [7:0] A;
reg [7:0] B;
wire e,g,l;
integer i,j;
eight_bit_comparator uut(A,B,e,g,l);
initial begin
    #5;
    $monitor("%t A=%b, B=%b, E=%b, G=%b, L=%b",$time,A,B,e,g,l);
end
initial begin 
    for(i=0;i<16;i=i+1) begin 
        #5 A<=i;
    end
end
initial begin 
    for(j=15;j>=0;j=j-1) begin 
        #5 B<=j;
    end
end
endmodule
