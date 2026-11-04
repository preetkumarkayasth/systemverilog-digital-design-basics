module four_bit_adder (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       Cin,

    output logic [3:0] Sum,
    output logic       Cout
);

    logic [4:0] Carry;

    // Initial carry input
    assign Carry[0] = Cin;

    // Four ripple-carry stages
    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin : FA_STAGE

            assign Sum[i] = A[i] ^ B[i] ^ Carry[i];

            assign Carry[i+1] =
                (A[i] & B[i]) |
                (A[i] & Carry[i]) |
                (B[i] & Carry[i]);

        end
    endgenerate

    // Final carry output
    assign Cout = Carry[4];

endmodule