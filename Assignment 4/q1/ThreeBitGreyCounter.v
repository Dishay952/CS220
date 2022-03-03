module ThreeBitGreyCounter(clock,reset,out,A,count);
input reset,clock;
output reg out;
output reg [2:0] A;
output reg count;
reg [2:0] curr_state;
reg [2:0] next_state;
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b011;
parameter S3=3'b010;
parameter S4=3'b110;
parameter S5=3'b111;
parameter S6=3'b101;
parameter S7=3'b100;
always@(posedge clock or negedge clock) begin 
    if(reset) begin
        curr_state<=S0;
        out<=0;
        // count<=0;
    end
    else begin
        curr_state<=next_state;
    end
end
always@(curr_state or clock) begin
    case (curr_state)
        S0: begin
                next_state<=S1;
                out<=0;
                A=S1;
                count=1;
        end
        S1: begin
                next_state<=S2;
                out<=0;
                A=S2;
                count=2;
        end
        S2: begin
                next_state<=S3;
                out<=0;
                A=S3;
                count=3;
        end
        S3: begin
                next_state<=S4;
                out<=0;
                A=S4;
                count=4;
        end
        S4: begin
                next_state<=S5;
                out<=0;
                A=S5;
                count=5;
        end
        S5: begin
                next_state<=S6;
                out<=0;
                A=S6;
                count=6;
        end
        S6: begin
                next_state<=S7;
                out<=0;
                A=S7;
                count=7;
        end
        S7: begin
                next_state<=S0;
                out<=1;
                A=S0;
                count=0;
        end
        default: begin
                next_state<=S0;
                count=0;
                out<=0;
                A=S0;
        end
    endcase
end
endmodule