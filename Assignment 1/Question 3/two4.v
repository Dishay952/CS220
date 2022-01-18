/*
Write a Verilog code to implement a two-to-four decoder. Then a top
module for three-to-eight decoder using two-to-four decoder. Write a test
bench to test three-to eight decoder for all possible input with five-time
delay.
*/

module two_to_four(A1, A0, enable, Y3, Y2, Y1, Y0);
input A1,A0,enable;
output Y3,Y2,Y1,Y0;
wire C3,C2,C1,C0;
Y3<=A1&A0;
Y2<=A1&(~A0);
Y1<=A0&(~A1);
Y0<=(~A1)&(~A0);
endmodule