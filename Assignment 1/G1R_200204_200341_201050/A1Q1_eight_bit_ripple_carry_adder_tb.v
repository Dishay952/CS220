`timescale 1ns/1ns
`include  "A1Q1_eight_bit_ripple_carry_adder.v"
module A1Q1_eight_bit_ripple_carry_adder_tb;
reg [7:0] A;
reg [7:0] B;
reg C_in;
wire [7:0] S;
wire C_out;
integer i;
integer j;
eight_bit_ripple_carry_adder uut(C_out,S,A,B,C_in);
initial begin
    A<=8'b0;
    B<=8'b0;
    C_in<=1'b0;
    #5;
    $monitor("%t A=%b, B=%b, Carry=%b, Sum=%b",$time,A,B,C_out,S);
end
initial begin
    for(i=0;i<4;i=i+1) begin 
        for(j=0;j<4;j=j+1) begin 
            #5 A<=i;B<=j;
        end
    end
end
endmodule