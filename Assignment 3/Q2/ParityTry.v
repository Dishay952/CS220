module odd_parity(clk,reset, ip,p,INPUT);
input clk,reset, ip;
output reg p;
reg [2:0] curr_state;
reg [2:0] next_state;
output reg [2:0] INPUT;
parameter A =3'b000;
parameter B=3'b001;
parameter C=3'b010;
parameter D=3'b011;
parameter E=3'b100;
parameter F=3'b101;
parameter G=3'b110; 
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
            INPUT[0]<=ip;
            INPUT[2]<=1'bx;
            INPUT[1]<=1'bx;
            if(ip == 1'b0) begin
                next_state<=B;
                p=1'bx;
            end
            else begin
                next_state<=E;
                p=1'bx;
            end
        end
        B: begin
            INPUT[1]<=ip;
            if(ip == 1'b1) begin
                next_state<=F;
                p=1'bx;
            end
            else begin
                next_state<=C;
                p=1'bx;
            end
        end
        C: begin
            INPUT[2]<=ip;
            if(ip == 1'b1) begin
                next_state<=G;
                p=1'bx;
            end
            else begin
                next_state<=D;
                p=1'bx;
            end
        end
        D: begin
            INPUT[0]<=ip;
            INPUT[1]<=1'bx;
            INPUT[2]<=1'bx;
            p=1'b1;
            if(ip == 1'b1) begin
                next_state<=E;
            end
            else begin 
                next_state<=B;
            end

        end
        E: begin
            INPUT[1]<=ip;
            if(ip == 1'b1) begin
                next_state<=C;
                p=1'bx;
            end
            else begin
                next_state<=F;
                p=1'bx;
            end
        end
        F: begin
            INPUT[2]<=ip;
            if(ip == 1'b1) begin
                next_state<=D;
                p=1'bx;
            end
            else begin
                next_state<=G;
                p=1'bx;
            end
        end
        G: begin
            INPUT[0]<=ip;
            INPUT[1]<=1'bx;
            INPUT[2]<=1'bx;
            if(ip == 1'b1) begin
                next_state<=E;
            end
            else begin 
                next_state<=B;
            end
            p=1'b0;
        end
        default: begin
            next_state<=A;
        end
    endcase
end
endmodule
//D pe 0 fir B op 1, else E op 1
// G pe 0 fir B op 0, else E op 0