module odd_parity(clk,reset, ip,p);
input clk,reset, ip;
output reg p;
reg [2:0] curr_state;
 reg [2:0] next_state;
parameter A = 3'b000,B=3'b001,C=3'b010,D=3'b11,E=3'b100,F=3'b101,G=3'b110; //S0 is odd number of 1's S1 is even number of 1's 
// initial begin
//   state=S1;
// end
//next state logic
always@(posedge clk or negedge clk) begin 
    if(reset) begin
        curr_state<=A;
    end
    else begin
        curr_state<=next_state;
    end
end
always@(curr_state or ip) begin
    case (curr_state)
        A: begin
            $display("state=A");
            if(ip == 1'b1) begin
                next_state<=B;
                p=1'b0;
            end
            else begin
                next_state<=E;
                p=1'b0;
            end
        end
        B: begin
            display("state=B");
            if(ip == 1'b1) begin
                next_state<=F;
                p=1'b0;
            end
            else begin
                next_state<=C;
                p=1'b0;
            end
        end
        C: begin
            if(ip == 1'b1) begin
                next_state<=G;
                p=1'b0;
            end
            else begin
                next_state<=D;
                p=1'b0;
            end
        end
        D: begin
            next_state<=A;
            p=1'b1;
        end
        E: begin
            if(ip == 1'b1) begin
                next_state<=C;
                p=1'b0;
            end
            else begin
                next_state<=F;
                p=1'b0;
            end
        end
        F: begin
            if(ip == 1'b1) begin
                next_state<=D;
                p=1'b0;
            end
            else begin
                next_state<=G;
                p=1'b0;
            end
        end
        G: begin
            next_state<=A;
            p=1'b0;
        end
        default: begin
            next_state<=A;
        end
    endcase
end
endmodule
