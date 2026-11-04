`timescale 1ns/1ps

module comparator_8bit_tb;

    logic [7:0] A, B;
    logic A_GT_B, A_LT_B, A_EQ_B;

    logic expected_GT, expected_LT, expected_EQ;

    logic [7:0] random_A, random_B;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i;

    // Instantiate the DUT
    comparator_8bit DUT (
        .A(A),
        .B(B),
        .A_GT_B(A_GT_B),
        .A_LT_B(A_LT_B),
        .A_EQ_B(A_EQ_B)
    );

    // Self-checking task
    task automatic check_pair(
        input logic [7:0] test_A,
        input logic [7:0] test_B
    );
        begin
            A = test_A;
            B = test_B;

            #10;

            // Independent expected-result calculation
            expected_GT = (test_A > test_B);
            expected_LT = (test_A < test_B);
            expected_EQ = (test_A == test_B);

            if ({A_GT_B, A_LT_B, A_EQ_B} !==
                {expected_GT, expected_LT, expected_EQ}) begin

                $display("FAIL: A=%0d, B=%0d | Actual=%b%b%b | Expected=%b%b%b",
                         test_A, test_B,
                         A_GT_B, A_LT_B, A_EQ_B,
                         expected_GT, expected_LT, expected_EQ);

                fail_count = fail_count + 1;
            end
            else begin
                pass_count = pass_count + 1;
            end
        end
    endtask

    // Main test sequence
    initial begin

        $display("------------------------------------------");
        $display("   8-BIT MAGNITUDE COMPARATOR TEST");
        $display("------------------------------------------");

        // Directed boundary and representative test cases
        check_pair(8'h00, 8'h00);
        check_pair(8'hFF, 8'hFF);
        check_pair(8'hFF, 8'h00);
        check_pair(8'h00, 8'hFF);
        check_pair(8'h80, 8'h7F);
        check_pair(8'h7F, 8'h80);
        check_pair(8'h01, 8'h00);
        check_pair(8'h00, 8'h01);
        check_pair(8'h55, 8'hAA);
        check_pair(8'hAA, 8'h55);

        // 1000 randomized input combinations
        for (i = 0; i < 1000; i = i + 1) begin
            random_A = $urandom_range(0, 255);
            random_B = $urandom_range(0, 255);

            check_pair(random_A, random_B);
        end

        // Final simulation summary
        $display("------------------------------------------");
        $display("            TEST SUMMARY");
        $display("------------------------------------------");
        $display("Directed Tests : 10");
        $display("Random Tests   : 1000");
        $display("Total Tests    : %0d", pass_count + fail_count);
        $display("PASS           : %0d", pass_count);
        $display("FAIL           : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT         : ALL TESTS PASSED");
        else
            $display("RESULT         : TESTS FAILED");

        $display("------------------------------------------");

        $finish;
    end

endmodule