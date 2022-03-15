module gcd(ans,a,b,clk);
input [7:0] a;
input [7:0] b;
input clk;
wire [7:0] c;
output reg [7:0] ans;
always @(*) begin
    if (a>b) begin
        c<=a%b
        gcd g1(ans,c,b,clk);
    end
    else if (a<b) begin 
        c<=b%a
        gcd g2(ans,c,a,clk);
    end
    else begin
        ans<=a;
    end
end
endmodule
