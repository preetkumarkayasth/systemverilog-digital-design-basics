
`timescale 1ns/1ps

module comparator_4bit_tb;

    logic [3:0] A;
    logic [3:0] B;

    logic A_GT_B;
    logic A_LT_B;
    logic A_EQ_B;

    logic expected_GT;
    logic expected_LT;
    logic expected_EQ;

    integer pass_count = 0;
    integer fail_count = 0;

    integer i, j;

    // DUT Instantiation
    comparator_4bit DUT (
        .A(A),
        .B(B),
        .A_GT_B(A_GT_B),
        .A_LT_B(A_LT_B),
        .A_EQ_B(A_EQ_B)
    );

    initial begin

        $display("======================================================");
        $display("          4-BIT MAGNITUDE COMPARATOR");
        $display("              EXHAUSTIVE VERIFICATION");
        $display("======================================================");
        $display(" A  |  B  | GT LT EQ | Expected GT LT EQ | Status");
        $display("------------------------------------------------------");

        // Exhaustive testing: 16 x 16 = 256 combinations
        for (i = 0; i < 16; i = i + 1) begin

            for (j = 0; j < 16; j = j + 1) begin

                A = i;
                B = j;

                #10;

                // Independent reference model
                expected_GT = 1'b0;
                expected_LT = 1'b0;
                expected_EQ = 1'b0;

                if (A > B)
                    expected_GT = 1'b1;
                else if (A < B)
                    expected_LT = 1'b1;
                else
                    expected_EQ = 1'b1;

                // Compare actual and expected outputs
                if ({A_GT_B, A_LT_B, A_EQ_B} !==
                    {expected_GT, expected_LT, expected_EQ}) begin

                    $display("%h  | %h  |  %b  %b  %b | %b  %b  %b | FAIL",
                             A, B,
                             A_GT_B, A_LT_B, A_EQ_B,
                             expected_GT, expected_LT, expected_EQ);

                    fail_count = fail_count + 1;

                end
                else begin

                    $display("%h  | %h  |  %b  %b  %b | %b  %b  %b | PASS",
                             A, B,
                             A_GT_B, A_LT_B, A_EQ_B,
                             expected_GT, expected_LT, expected_EQ);

                    pass_count = pass_count + 1;

                end

            end

        end

        $display("======================================================");
        $display("TOTAL TESTS        : %0d", pass_count + fail_count);
        $display("TOTAL TESTS PASSED : %0d", pass_count);
        $display("TOTAL TESTS FAILED : %0d", fail_count);
        $display("======================================================");

        if (fail_count == 0)
            $display("OVERALL RESULT: ALL TESTS PASSED");
        else
            $display("OVERALL RESULT: TESTS FAILED");

        $finish;

    end

endmodule
