module A2_Q1_carry_look_ahead_adder(C_out,S,A,B,C_in);
input [3:0] A;
input [3:0] B;
input C_in;
output C_out;
output [3:0] S;
wire [3:0] P; //P[i](propogator) corresponds to the XOR of the ith digits of A and B
wire [3:0] G; //G[i](generator) corresponds to the AND of the ith digits of A and B
wire [3:0] C; //C[i] (carry) corresponds to the ith digit of the carry,where C[0] is C_in
//We write each bit of carry in terms of C_in to minimise delay.
assign G[0]=A[0]&B[0];
assign G[1]=A[1]&B[1];
assign G[2]=A[2]&B[2];
assign G[3]=A[3]&B[3];
assign P[0]=A[0]^B[0];
assign P[1]=A[1]^B[1];
assign P[2]=A[2]^B[2];
assign P[3]=A[3]^B[3];
assign C[0] = G[0]|P[1]&C_in ; //We use the formula C[i]=G[i]+P[i].C[i-1] 
assign C[1] = G[1]|(P[1]&G[0])|(P[1]&P[0]&C_in);
assign C[2] = G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&C_in);
assign C[3] = G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&C_in);
assign S[0]=C_in^P[0];
assign S[1]=C[0]^P[1];
assign S[2]=C[1]^P[2];
assign S[3]=C[2]^P[3];
assign C_out=C[3];
endmodule