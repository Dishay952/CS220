module parity(A,p);
input [3:0] A;
output p;
assign p=~(A[0]^A[1]^A[2]);
endmodule


