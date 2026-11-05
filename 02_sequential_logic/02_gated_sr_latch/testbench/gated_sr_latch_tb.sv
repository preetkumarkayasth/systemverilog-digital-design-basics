
`timescale 1ns/1ps

module gated_sr_latch_tb;

    logic EN, S, R;
    logic Q, Q_bar;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT instantiation
    gated_sr_latch DUT (
        .EN    (EN),
        .S     (S),
        .R     (R),
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
                    "FAIL: %s | EN=%b S=%b R=%b | Q=%b Q_bar=%b",
                    test_name, EN, S, R, Q, Q_bar
                );

                $display(
                    "Expected: Q=%b Q_bar=%b",
                    expected_Q, expected_Q_bar
                );

                fail_count = fail_count + 1;
            end
            else begin

                $display(
                    "PASS: %s | EN=%b S=%b R=%b | Q=%b Q_bar=%b",
                    test_name, EN, S, R, Q, Q_bar
                );

                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin

        $display("------------------------------------------");
        $display("       GATED SR LATCH TEST");
        $display("------------------------------------------");

        // 1. Set
        EN = 1'b1;
        S  = 1'b1;
        R  = 1'b0;
        check_output(1'b1, 1'b0, "SET");

        // 2. Hold while disabled
        EN = 1'b0;
        S  = 1'b0;
        R  = 1'b0;
        check_output(1'b1, 1'b0, "DISABLED HOLD");

        // 3. Set input asserted while disabled
        EN = 1'b0;
        S  = 1'b1;
        R  = 1'b0;
        check_output(1'b1, 1'b0, "DISABLED SET");

        // 4. Reset input asserted while disabled
        EN = 1'b0;
        S  = 1'b0;
        R  = 1'b1;
        check_output(1'b1, 1'b0, "DISABLED RESET");

        // 5. Hold while enabled
        EN = 1'b1;
        S  = 1'b0;
        R  = 1'b0;
        check_output(1'b1, 1'b0, "ENABLED HOLD");

        // 6. Reset
        EN = 1'b1;
        S  = 1'b0;
        R  = 1'b1;
        check_output(1'b0, 1'b1, "RESET");

        // 7. Set input asserted while disabled
        EN = 1'b0;
        S  = 1'b1;
        R  = 1'b0;
        check_output(1'b0, 1'b1, "DISABLED SET AFTER RESET");

        // 8. Invalid condition
        EN = 1'b1;
        S  = 1'b1;
        R  = 1'b1;
        check_output(1'b0, 1'b0, "INVALID CONDITION");

        // 9. Recovery using Reset
        EN = 1'b1;
        S  = 1'b0;
        R  = 1'b1;
        check_output(1'b0, 1'b1, "RECOVERY RESET");

        // 10. Set again
        EN = 1'b1;
        S  = 1'b1;
        R  = 1'b0;
        check_output(1'b1, 1'b0, "FINAL SET");

        // Test summary
        $display("------------------------------------------");
        $display("               TEST SUMMARY");
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
