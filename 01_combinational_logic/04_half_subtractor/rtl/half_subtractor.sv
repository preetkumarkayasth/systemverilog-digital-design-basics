module half_subtractor (
    input  logic A,
    input  logic B,

    output logic Difference,
    output logic Borrow
);

    // Half Subtractor Logic

    assign Difference = A ^ B;
    assign Borrow     = (~A) & B;

endmodule