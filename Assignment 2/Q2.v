module JohnsonCounter();
    Clock(clk)
    D_FF D0(q1,~q8,clk,reset);
    D_FF D1(q2,q1,clk,reset);
    D_FF D2(q3,q2,clk,reset);
    D_FF D3(q4,q3,clk,reset);
    D_FF D4(q5,q4,clk,reset);
    D_FF D5(q6,q5,clk,reset);
    D_FF D6(q7,q6,clk,reset);
    D_FF D7(q8,q7,clk,reset);
endmodule;

module Clock(clk);
    output clk;
    clk<=1'b0;
    always @(*)
        #5 clk<=~clk;
endmodule;


module D_FF(q,d,clk,reset);
    output q;
    input d,clk,reset;
    reg q;
    always @(posedge reset or negedge clk)
        if(reset)
            q<=1'b0;
        else
            q<=d;
endmodule;