`include "A4Q2_OneBitAdderSubtractor.v"

module eight_bit_adder_subtractor(S,overflow,A,B,optype);
input [7:0] A;
input [7:0] B;
input optype;
output [7:0]S;
output reg overflow;
wire w[7:0];// 6 wires for transferring C_out to C_in of next one_bit_adder_subtractor 
one_bit_adder_subtractor f1(w[0],S[0],A[0],B[0],optype,optype);
one_bit_adder_subtractor f2(w[1],S[1],A[1],B[1],w[0],optype);
one_bit_adder_subtractor f3(w[2],S[2],A[2],B[2],w[1],optype);
one_bit_adder_subtractor f4(w[3],S[3],A[3],B[3],w[2],optype);
one_bit_adder_subtractor f5(w[4],S[4],A[4],B[4],w[3],optype);
one_bit_adder_subtractor f6(w[5],S[5],A[5],B[5],w[4],optype);
one_bit_adder_subtractor f7(w[6],S[6],A[6],B[6],w[5],optype);
one_bit_adder_subtractor f8(w[7],S[7],A[7],B[7],w[6],optype);
always @(*) begin
    if (w[7]==w[6]) begin
        overflow=1'b0;
    end
    else begin
        overflow = 1'b1;
    end
end

endmodule