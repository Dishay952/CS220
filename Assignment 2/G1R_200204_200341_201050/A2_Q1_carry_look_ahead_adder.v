module A2_Q1_carry_look_ahead_adder(C_out,S,A,B,C_in);
input [7:0] A;
input [7:0] B;
input C_in;
output C_out;
output [7:0] S;
wire [7:0] P; //P[i](propogator) corresponds to the XOR of the ith digits of A and B
wire [7:0] G; //G[i](generator) corresponds to the AND of the ith digits of A and B
wire [8:0] C; //C[i] (carry) corresponds to the ith digit of the carry,where C[0] is C_in
//We write each bit of carry in terms of C_in to minimise delay.
assign G[0]=A[0]&B[0];
assign P[0]=A[0]^B[0];
assign C[0]=C_in;
assign S[0]=C[0]^P[0];
generate
genvar i;
    for (i=1; i<8; i=i+1) begin
            assign G[i]=A[i]&B[i];
            assign P[i]=A[i]^B[i];
            assign C[i]=G[i-1]|P[i-1]&C[i-1];
            assign S[i]=C[i]^P[i];
    end
endgenerate
assign C[8]=G[7]|P[7]&C[7];
assign C_out=C[8];
endmodule
