module comparator(A,B,E,G,L);
input A,B;
output E,G,L;
assign E=(A==B);
assign G=(A>B);
assign L=(A<B);
endmodule

// module tb;
// reg A,B;
// wire E,G,L;
// comparator c(A,B,E,G,L);
// initial begin
//     A=0;
//     B=0;
//     #5;
//     $display("E=%b, G=%b, L=%b",E,G,L);
//     A=1;
//     B=0;
//     #5;
//     $display("E=%b, G=%b, L=%b",E,G,L);
// end
// endmodule