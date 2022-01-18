/*
Write a Verilog code to implement a two-to-four decoder. Then a top
module for three-to-eight decoder using two-to-four decoder. Write a test
bench to test three-to eight decoder for all possible input with five-time
delay.
*/

module two_to_four(A1, A0, enable, Y3, Y2, Y1, Y0);
input A1,A0,enable;
output Y3,Y2,Y1,Y0;
not n1(nA1,A1);
not n0(nA0,A0);
and a0(Y0,nA1,nA0,enable);
and a1(Y1,nA1,A0,enable);
and a2(Y2,A1,nA0,enable);
and a3(Y3,A1,A0,enable);
endmodule