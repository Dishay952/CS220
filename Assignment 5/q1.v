module gcd(ans,a,b);
input [7:0] a;
input [7:0] b;
output reg [7:0] ans;
integer count=0;
reg [7:0] u;
reg [7:0] v;
always @(*) begin
u=a;
v=b;
while (u != v) begin
    if (u[0] == 0 && v[0] == 0) begin
        u=u>>1;
        v=v>>1;
        count=count+1;
    end
    else if (u[0]==1 && v[0]==0) begin
        v=v>>1;
    end
    else if (u[0]==0 && v[0]==1) begin
        u=u>>1;
    end
    else begin
        if (u>=v) begin
            u=(u-v)>>1;
        end
        else begin
            v=(v-u)>>1;
        end
    end
end

while (count>0) begin
    u=u<<1;
    count=count-1;
end
ans=u;
end
endmodule