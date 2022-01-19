/*
Write a Verilog code to implement a two-to-four decoder. Then a top
module for three-to-eight decoder using two-to-four decoder. Write a test
bench to test three-to eight decoder for all possible input with five-time
delay.
*/

module two_to_four(A1, A0, enable, Y3, Y2, Y1, Y0);
input A1,A0,enable;
output reg Y3,Y2,Y1,Y0;
wire C3,C2,C1,C0;
assign C3=A1&A0;
assign C2=A1&(~A0);
assign C1=A0&(~A1);
assign C0=(~A1)&(~A0);
always @(*)
    if(enable==0)
        begin
            Y3<=1'b0;
            Y2<=1'b0;
            Y1<=1'b0;
            Y0<=1'b0;
        end 
    else 
        begin
            Y3<=C3;
            Y2<=C2;
            Y1<=C1;
            Y0<=C0;
        end
endmodule