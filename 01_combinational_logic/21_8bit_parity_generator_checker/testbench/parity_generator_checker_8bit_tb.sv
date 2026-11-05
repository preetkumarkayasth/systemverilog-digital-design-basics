
`timescale 1ns/1ps

module parity_generator_checker_8bit_tb;

    logic [7:0] Data;
    logic       Received_Parity;

    logic Even_Parity;
    logic Odd_Parity;
    logic Even_Error;
    logic Odd_Error;

    logic expected_Even_Parity;
    logic expected_Odd_Parity;
    logic expected_Even_Error;
    logic expected_Odd_Error;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i, j;

    // DUT instantiation
    parity_generator_checker_8bit DUT (
        .Data            (Data),
        .Received_Parity (Received_Parity),
        .Even_Parity     (Even_Parity),
        .Odd_Parity      (Odd_Parity),
        .Even_Error      (Even_Error),
        .Odd_Error       (Odd_Error)
    );

    // Self-checking task
    task automatic check_parity(
        input logic [7:0] test_Data,
        input logic       test_Received_Parity
    );
        begin
            Data = test_Data;
            Received_Parity = test_Received_Parity;

            // Independent expected-value calculation
            expected_Even_Parity = ^test_Data;
            expected_Odd_Parity  = ~(^test_Data);

            expected_Even_Error =
                ^{test_Data, test_Received_Parity};

            expected_Odd_Error =
                ~^{test_Data, test_Received_Parity};

            #10;

            if ((Even_Parity !== expected_Even_Parity) ||
                (Odd_Parity !== expected_Odd_Parity) ||
                (Even_Error !== expected_Even_Error) ||
                (Odd_Error !== expected_Odd_Error)) begin

                $display(
                    "FAIL: Data=%b RP=%b | EP=%b OP=%b EE=%b OE=%b",
                    test_Data, test_Received_Parity,
                    Even_Parity, Odd_Parity,
                    Even_Error, Odd_Error
                );

                $display(
                    "Expected: EP=%b OP=%b EE=%b OE=%b",
                    expected_Even_Parity, expected_Odd_Parity,
                    expected_Even_Error, expected_Odd_Error
                );

                fail_count = fail_count + 1;
            end
            else begin
                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin
        $display("------------------------------------------");
        $display("  8-BIT PARITY GENERATOR AND CHECKER TEST");
        $display("------------------------------------------");

        // Exhaustive testing:
        // 256 data patterns x 2 received parity values
        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                check_parity(i, j);
            end
        end

        $display("------------------------------------------");
        $display("             TEST SUMMARY");
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
