module JohnsonCounter(q,clk,reset);
    input clk;
    input reset;
    output [7:0] q;
    D_FF D0(q[0],~q[7],clk,reset);
    D_FF D1(q[1],q[0],clk,reset);
    D_FF D2(q[2],q[1],clk,reset);
    D_FF D3(q[3],q[2],clk,reset);
    D_FF D4(q[4],q[3],clk,reset);
    D_FF D5(q[5],q[4],clk,reset);
    D_FF D6(q[6],q[5],clk,reset);
    D_FF D7(q[7],q[6],clk,reset);
endmodule;

module D_FF(q,d,clk,reset);
    output q;
    input d,clk,reset;
    reg q;
    always @(posedge reset or posedge clk)
        if(reset)
            q=1'b0;
        else
            q=d;
endmodule;