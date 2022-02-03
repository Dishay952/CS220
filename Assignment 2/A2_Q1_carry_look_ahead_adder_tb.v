`timescale 1ns/1ns
`include  "A2_Q1_carry_look_ahead_adder.v"
module carry_look_ahead_adder_tb;
reg [3:0] A;
reg [3:0] B;
reg C_in;
wire [3:0] S;
// wire [3:0] P;
// wire [3:0] C;
wire C_out;
integer i;
integer j;
carry_look_ahead_adder uut(C_out,S,A,B,C_in);
initial begin
    A<=4'b0;
    B<=4'b0;
    C_in<=1'b0;
    #5;
    $monitor("%t A=%b, B=%b, Carry=%b, Sum=%b",$time,A,B,C_out,S);
end
initial begin
    for(i=14;i>0;i=i-1) begin 
        for(j=2;j<4;j=j+1) begin 
            #5 A<=i;B<=j;
        end
    end
end
initial begin
    #77 $finish;
end

endmodule