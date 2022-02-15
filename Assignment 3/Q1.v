// Detect 1010 sequence with overlapping

module 1010detector(ip, clk reset, op);
    input ip, clk, reset;
    output reg op;
    reg [1:0] currState, nextState;
    parameter first=2'b00;
    parameter second=2'b01;
    parameter third=2'b10;
    parameter fourth=2'b11;
    always @ (posedge clk) begin 
        if(reset)
            currState<=first;
        else
            currState<=nextState;
    always @ (ip) begin
        if(ip)
            if(currState==first)
                nextState=second;
            else
                nextState=first;
            if(currState==third)
                nextState=fourth;
            else
                nextState=first;
        else
            if(currState==second)
                nextState=third;
            else
                nextState=first;
            if(currState==third)
                nextState=fourth;
            else
                nextState=first;