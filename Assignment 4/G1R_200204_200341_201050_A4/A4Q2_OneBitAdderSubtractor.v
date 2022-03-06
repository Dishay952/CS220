module one_bit_adder_subtractor(C_out,S,A,B,C_in,opcode); //opcode 0 or +, 1 for -
    input A,B,C_in,opcode;
    output C_out;
    output S;
    //This is true for both addition and subtraction 
    assign S=(A^(B^opcode))^C_in;
    assign C_out=(A&(B^opcode))|((B^opcode)&C_in)|(C_in&A);
endmodule