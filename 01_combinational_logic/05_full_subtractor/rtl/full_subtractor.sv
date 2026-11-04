module full_subtractor (
    input  logic A,
    input  logic B,
    input  logic Bin,

    output logic Difference,
    output logic Bout
);

    // Full Subtractor Logic

    assign Difference = A ^ B ^ Bin;

    assign Bout = (~A & B) |
                  (~A & Bin) |
                  (B & Bin);

endmodule