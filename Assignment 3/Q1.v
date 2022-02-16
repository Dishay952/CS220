// Detect 1010 sequence with overlapping

module Q1(op,ip,reset,clk);
    input ip, clk, reset;
    output reg op;
    reg [1:0] currState, nextState;
    parameter first=2'b00;
    parameter second=2'b01;
    parameter third=2'b10;
    parameter fourth=2'b11;

    always@(posedge clk) begin 
        if(reset) begin
            currState<=first;
        end
        else begin
            currState<=nextState;
        end
    end
    always@(ip or currState) begin
        case (currState)
            first: begin 
                if(ip == 1'b1) begin
                    nextState=second;
                    op=1'b0;
                end
                else begin
                    nextState=first;
                    op=1'b0;
                end
            end
            second: begin
                if(ip == 1'b1) begin
                    nextState=first;
                    op=1'b0;
                end
                else begin
                    nextState=third;
                    op=1'b0;
                end
            end
            third:begin
                if(ip == 1'b1) begin
                    nextState=fourth;
                    op=1'b0;
                end
                else begin
                    nextState=first;
                    op=1'b0;
                end
            end
            fourth: begin
                if(ip == 1'b0) begin
                    nextState=third;
                    op=1'b1;
                end
                else begin
                    nextState=first;
                    op=1'b0;
                end
            end
            default: begin
                nextState=first;
            end
        endcase
    end
endmodule;