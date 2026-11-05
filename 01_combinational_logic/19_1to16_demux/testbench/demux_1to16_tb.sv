
`timescale 1ns/1ps

module demux_1to16_tb;

    logic        Din;
    logic [3:0]  Sel;
    logic [15:0] Y;

    logic [15:0] expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i, j;

    // DUT instantiation
    demux_1to16 DUT (
        .Din (Din),
        .Sel (Sel),
        .Y   (Y)
    );

    // Task to check one input combination
    task automatic check_demux(
        input logic       test_Din,
        input logic [3:0] test_Sel
    );
        begin
            Din = test_Din;
            Sel = test_Sel;
            #10;

            expected_Y = 16'b0;

            if (test_Din)
                expected_Y[test_Sel] = 1'b1;

            if (Y !== expected_Y) begin
                $display(
                    "FAIL: Din=%b | Sel=%b | Actual Y=%b | Expected Y=%b",
                    test_Din, test_Sel, Y, expected_Y
                );
                fail_count = fail_count + 1;
            end
            else if ($countones(Y) != test_Din) begin
                $display(
                    "FAIL: One-hot violation: Din=%b | Sel=%b | Y=%b",
                    test_Din, test_Sel, Y
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
        $display("          1:16 DEMUX TEST");
        $display("------------------------------------------");

        // Exhaustive testing: Din = 0 and Din = 1
        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                check_demux(i, j);
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
