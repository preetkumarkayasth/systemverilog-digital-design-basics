
`timescale 1ns/1ps

module decoder_4to16_tb;

    logic [3:0] A;
    logic [15:0] Y;

    logic [15:0] expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i;

    // DUT instantiation
    decoder_4to16 DUT (
        .A(A),
        .Y(Y)
    );

    // Self-checking task
    task automatic check_decoder(
        input logic [3:0] test_A
    );
        begin
            A = test_A;

            #10;

            // Independent expected-output calculation
            expected_Y = 16'b0000_0000_0000_0000;
            expected_Y[test_A] = 1'b1;

            if (Y !== expected_Y) begin

                $display(
                    "FAIL: A=%b | Actual Y=%b | Expected Y=%b",
                    test_A, Y, expected_Y
                );

                fail_count = fail_count + 1;
            end
            else begin
                pass_count = pass_count + 1;
            end

            // Verify one-hot output behavior
            if ($countones(Y) != 1) begin

                $display(
                    "FAIL: One-hot violation for A=%b, Y=%b",
                    test_A, Y
                );

                fail_count = fail_count + 1;
            end
        end
    endtask

    // Main test sequence
    initial begin

        $display("------------------------------------------");
        $display("         4:16 DECODER TEST");
        $display("------------------------------------------");

        // Exhaustive testing of all 16 input combinations
        for (i = 0; i < 16; i = i + 1) begin
            check_decoder(i);
        end

        // Final simulation summary
        $display("------------------------------------------");
        $display("           TEST SUMMARY");
        $display("------------------------------------------");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT      : ALL TESTS PASSED");
        else
            $display("RESULT      : TESTS FAILED");

        $display("------------------------------------------");

        $finish;
    end

endmodule
