// Detect 1010 sequence with overlapping

module Q1(op,ip,reset,clk);
    input ip, clk, reset;
    output reg op;
    reg [1:0] currState, nextState;
    parameter S0=2'b00;
    parameter S1=2'b01;
    parameter S2=2'b10;
    parameter S3=2'b11;

    always@(posedge clk) begin 
        if(reset) begin
            currState<=S0;
        end
        else begin
            currState<=nextState;
        end
    end
    always@(ip or currState) begin
        case (currState)
            S0: begin 
                if(ip == 1'b1) begin
                    nextState=S1;
                    op=1'b0;
                end
                else begin
                    nextState=S0;
                    op=1'b0;
                end
            end
            S1: begin
                if(ip == 1'b1) begin
                    nextState=S1;
                    op=1'b0;
                end
                else begin
                    nextState=S2;
                    op=1'b0;
                end
            end
            S2:begin
                if(ip == 1'b1) begin
                    nextState=S3;
                    op=1'b0;
                end
                else begin
                    nextState=S0;
                    op=1'b0;
                end
            end
            S3: begin
                if(ip == 1'b0) begin
                    nextState=S2;
                    op=1'b1;
                end
                else begin
                    nextState=S1;
                    op=1'b0;
                end
            end
            default: begin
                nextState=S0;
            end
        endcase
    end
endmodule;