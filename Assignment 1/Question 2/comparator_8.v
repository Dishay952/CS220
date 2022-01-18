`include "comparator.v"
module comparator_8(A,B,e,g,l);
input [7:0] A;
input [7:0] B;
wire [7:0] E;
wire [7:0] G;
wire [7:0] L;
output e,g,l;
comparator c0(A[7],B[7],E[7],G[7],L[7]);
comparator c1(A[6],B[6],E[6],G[6],L[6]);
comparator c2(A[5],B[5],E[5],G[5],L[5]);
comparator c3(A[4],B[4],E[4],G[4],L[4]);
comparator c4(A[3],B[3],E[3],G[3],L[3]);
comparator c5(A[2],B[2],E[2],G[2],L[2]);
comparator c6(A[1],B[1],E[1],G[1],L[1]);
comparator c7(A[0],B[0],E[0],G[0],L[0]);
// initial begin
//     if(G[7]==1 || L[7]==1)
//     begin
//         e=E[7];
//         l=L[7];
//         g=G[7];   
//     end
//     else
//     begin
//         if(G[6]==1 || L[6]==1)
//         begin
//             e=E[6];
//             l=L[6];
//             g=G[6];
//         end
//         else
//         begin
//             if(G[5]==1 || L[5]==1)
//             begin
//                 e=E[5];
//                 l=L[5];
//                 g=G[5];
//             end
//             else
//             begin
//                 if(G[4]==1 || L[4]==1)
//                 begin
//                     e=E[4];
//                     l=L[4];
//                     g=G[4];
//                 end
//                 else
//                 begin
//                     if(G[3]==1 || L[3]==1)
//                     begin
//                         e=E[3];
//                         l=L[3];
//                         g=G[3];
//                     end
//                     else
//                     begin
//                         if(G[2]==1 || L[2]==1)
//                         begin
//                             e=E[2];
//                             l=L[2];
//                             g=G[2];
//                         end
//                         else
//                         begin
//                             if(G[1]==1 || L[1]==1)
//                             begin
//                                 e=E[1];
//                                 l=L[1];
//                                 g=G[1];
//                             end
//                             else
//                             begin
//                                 e=E[0];
//                                 l=L[0];
//                                 g=G[0];
//                             end
//                         end
//                     end
//                 end
//             end
//         end
//     end
    
// end
assign e=E[7]&E[6]&E[5]&E[4]&E[3]&E[2]&E[1]&E[0];
assign g=G[7]|(E[7]&(G[6]|(E[6]&(G[5]|(E[5]&(G[4]|(E[4]&(G[3]|(E[3]&(G[2]|(E[2]&(G[1]|(E[1]&G[0])))))))))))));
assign l=!(e|g);
endmodule
