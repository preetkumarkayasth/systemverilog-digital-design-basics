
module comparator_8bit (

    input  logic [7:0] A,
    input  logic [7:0] B,

    output logic A_GT_B,
    output logic A_LT_B,
    output logic A_EQ_B

);

    always_comb begin

        // Default output assignments
        A_GT_B = 1'b0;
        A_LT_B = 1'b0;
        A_EQ_B = 1'b0;

        // Compare the two 8-bit unsigned numbers
        if (A > B) begin

            A_GT_B = 1'b1;

        end
        else if (A < B) begin

            A_LT_B = 1'b1;

        end
        else begin

            A_EQ_B = 1'b1;

        end

    end

endmodule
