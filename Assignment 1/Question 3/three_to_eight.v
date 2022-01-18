/*
Write a Verilog code to implement a two-to-four decoder. Then a top
module for three-to-eight decoder using two-to-four decoder. Write a test
bench to test three-to eight decoder for all possible input with five-time
delay.
*/

module three_to_eight(B2,B1,B0,enable,P7,P6,P5,P4,P3,P2,P1,P0);
    input B2,B1,B0,enable;
    output P7,P6,P5,P4,P3,P2,P1,P0;
    wire D0,D1,D2,D3;
    wire zer_net=1'b0;
    two_to_four decode1(zer_net,B2,enable,D3,D2,D1,D0);
    two_to_four decode2(B1,B0,D0,P3,P2,P1,P0);
    two_to_four decode3(B1,B0,D1,P7,P6,P5,P4);
endmodule;


module two_to_four(A1, A0, enable, Y3, Y2, Y1, Y0);
input A1,A0,enable;
output reg Y3,Y2,Y1,Y0;
wire C3,C2,C1,C0;
wire nA1,nA0;
not n1(nA1,A1);
not n2(nA0,A0);
and a1(C3,A1,A0);
and a2(C2,A1,nA0);
and a3(C1,nA1,A0);
and a4(C0,nA1,nA0);
always @(A1,A0,enable)
    if(enable==0)
        begin
            Y3<=1'b0;
            Y2<=1'b0;
            Y1<=1'b0;
            Y0<=1'b0;
        end 
    else 
        begin
            Y3 <= C3;
            Y2 <= C2;
            Y1 <= C1;
            Y0 <= C0;
            
        end
endmodule
