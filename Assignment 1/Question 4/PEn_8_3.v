module PEn_8_3(D,Y);
input  [7:0] D;
output reg [2:0] Y;
integer i;
always @(*) begin
    Y=0;
    for(i=0;i<=7;i=i+1)
        if(D[i]) begin
            Y=i;
            i=8;
        end
end
endmodule