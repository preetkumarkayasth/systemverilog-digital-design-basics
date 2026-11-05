
`timescale 1ns/1ps

module d_latch_tb;

    logic D;
    logic EN;

    logic Q;
    logic Q_bar;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT instantiation
    d_latch DUT (
        .D     (D),
        .EN    (EN),
        .Q     (Q),
        .Q_bar (Q_bar)
    );

    // Self-checking task
    task automatic check_output(
        input logic expected_Q,
        input logic expected_Q_bar,
        input string test_name
    );
        begin
            #10;

            if ((Q !== expected_Q) ||
                (Q_bar !== expected_Q_bar)) begin

                $display(
                    "FAIL: %s | EN=%b D=%b | Q=%b Q_bar=%b",
                    test_name, EN, D, Q, Q_bar
                );

                $display(
                    "Expected: Q=%b Q_bar=%b",
                    expected_Q, expected_Q_bar
                );

                fail_count = fail_count + 1;
            end
            else begin

                $display(
                    "PASS: %s | EN=%b D=%b | Q=%b Q_bar=%b",
                    test_name, EN, D, Q, Q_bar
                );

                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin

        $display("------------------------------------------");
        $display("          D LATCH TEST");
        $display("------------------------------------------");

        // 1. Store 0
        EN = 1'b1;
        D  = 1'b0;
        check_output(1'b0, 1'b1, "STORE ZERO");

        // 2. Store 1
        EN = 1'b1;
        D  = 1'b1;
        check_output(1'b1, 1'b0, "STORE ONE");

        // 3. Hold previous 1
        EN = 1'b0;
        D  = 1'b0;
        check_output(1'b1, 1'b0, "HOLD AFTER ONE");

        // 4. Change data while disabled
        EN = 1'b0;
        D  = 1'b1;
        check_output(1'b1, 1'b0, "DATA CHANGE WHILE DISABLED");

        // 5. Store 0
        EN = 1'b1;
        D  = 1'b0;
        check_output(1'b0, 1'b1, "STORE ZERO AGAIN");

        // 6. Hold previous 0
        EN = 1'b0;
        D  = 1'b1;
        check_output(1'b0, 1'b1, "HOLD AFTER ZERO");

        // 7. Store 1
        EN = 1'b1;
        D  = 1'b1;
        check_output(1'b1, 1'b0, "STORE ONE AGAIN");

        // 8. Store 0
        EN = 1'b1;
        D  = 1'b0;
        check_output(1'b0, 1'b1, "STORE ZERO");

        // 9. Store 1
        EN = 1'b1;
        D  = 1'b1;
        check_output(1'b1, 1'b0, "STORE ONE");

        // 10. Hold previous 1
        EN = 1'b0;
        D  = 1'b0;
        check_output(1'b1, 1'b0, "HOLD ONE");

        // 11. Store 0
        EN = 1'b1;
        D  = 1'b0;
        check_output(1'b0, 1'b1, "STORE ZERO");

        // 12. Hold previous 0
        EN = 1'b0;
        D  = 1'b1;
        check_output(1'b0, 1'b1, "HOLD ZERO");

        // Test summary
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
