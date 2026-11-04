
module four_bit_subtractor (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic       Bin,
    output logic [3:0] Difference,
    output logic       Bout
);

    logic [4:0] Borrow;

    assign Borrow[0] = Bin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : FS_STAGE

            assign Difference[i] =
                A[i] ^ B[i] ^ Borrow[i];

            assign Borrow[i+1] =
                (~A[i] & B[i]) |
                (~A[i] & Borrow[i]) |
                (B[i] & Borrow[i]);

        end
    endgenerate

    assign Bout = Borrow[4];

endmodule
