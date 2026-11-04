
module logic_gates (
    input  logic A,
    input  logic B,

    output logic AND_out,
    output logic OR_out,
    output logic NOT_out,
    output logic NAND_out,
    output logic NOR_out,
    output logic XOR_out,
    output logic XNOR_out
);

    // Logic gate operations

    assign AND_out  = A & B;
    assign OR_out   = A | B;
    assign NOT_out  = ~A;
    assign NAND_out = ~(A & B);
    assign NOR_out  = ~(A | B);
    assign XOR_out  = A ^ B;
    assign XNOR_out = ~(A ^ B);

endmodule
