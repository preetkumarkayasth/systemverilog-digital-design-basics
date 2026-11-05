
`timescale 1ns/1ps

module sr_latch_nor_tb;

    logic S, R;
    logic Q, Q_bar;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT instantiation
    sr_latch_nor DUT (
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
                    "FAIL: %s | S=%b R=%b | Q=%b Q_bar=%b",
                    test_name, S, R, Q, Q_bar
                );

                $display(
                    "Expected: Q=%b Q_bar=%b",
                    expected_Q, expected_Q_bar
                );

                fail_count = fail_count + 1;
            end
            else begin
                $display(
                    "PASS: %s | S=%b R=%b | Q=%b Q_bar=%b",
                    test_name, S, R, Q, Q_bar
                );

                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin

        $display("--------------------------------------");
        $display("  SR LATCH USING NOR GATES TEST");
        $display("--------------------------------------");

        // Initial condition: establish Set state
        S = 1'b1;
        R = 1'b0;
        check_output(1'b1, 1'b0, "SET");

        // Hold after Set
        S = 1'b0;
        R = 1'b0;
        check_output(1'b1, 1'b0, "HOLD AFTER SET");

        // Reset
        S = 1'b0;
        R = 1'b1;
        check_output(1'b0, 1'b1, "RESET");

        // Hold after Reset
        S = 1'b0;
        R = 1'b0;
        check_output(1'b0, 1'b1, "HOLD AFTER RESET");

        // Invalid condition
        S = 1'b1;
        R = 1'b1;
        check_output(1'b0, 1'b0, "INVALID CONDITION");

        // Recovery using Reset
        S = 1'b0;
        R = 1'b1;
        check_output(1'b0, 1'b1, "RECOVERY RESET");

        // Set again
        S = 1'b1;
        R = 1'b0;
        check_output(1'b1, 1'b0, "RECOVERY SET");

        // Final summary
        $display("--------------------------------------");
        $display("             TEST SUMMARY");
        $display("--------------------------------------");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT      : ALL TESTS PASSED");
        else
            $display("RESULT      : TESTS FAILED");

        $display("--------------------------------------");

        $finish;

    end

endmodule
