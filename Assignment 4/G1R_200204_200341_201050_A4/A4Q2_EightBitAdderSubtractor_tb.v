`timescale 1ns/1ns
`include  "A4Q2_EightBitAdderSubtractor.v"

//In 2's complement notation, we can represent maximum -128 to 127 with 8 bits 

module eight_bit_adder_subtractor_tb;
reg [7:0] A;
reg [7:0] B;
reg optype;
wire [7:0] S;
wire overflow;
integer i;
integer j;
integer k;
eight_bit_adder_subtractor uut(S,overflow,A,B,optype);
initial begin
    A<=8'b0;
    B<=8'b0; //have tested corner cases and this works 
    optype<=1'b0;
    $monitor("%t , optype=%b, A=%b, B=%b, overflow=%b, Sum=%b",$time,optype,A,B,overflow,S);
end
initial begin
    for(i=0;i<4;i=i+1) begin 
        for(j=128;j>124;j=j-1) begin 
            #5 A<=(i+1);B<=j;
        end
        #5 optype<=1'b1; //subtraction
    end
end
endmodule