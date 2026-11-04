add wave /*
`timescale 1ns/1ps

module demux_1to8_tb;

    logic Din;
    logic [2:0] Sel;
    logic [7:0] Y;

    logic [7:0] expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i, j;

    // DUT instantiation
    demux_1to8 DUT (
        .Din(Din),
        .Sel(Sel),
        .Y(Y)
    );

    // Self-checking task
    task automatic check_demux(
        input logic test_Din,
        input logic [2:0] test_Sel
    );
        begin
            Din = test_Din;
            Sel = test_Sel;

            #10;

            // Independent expected-output calculation
            expected_Y = 8'b0000_0000;

            if (test_Din == 1'b1)
                expected_Y[test_Sel] = 1'b1;

            if (Y !== expected_Y) begin

                $display(
                    "FAIL: Din=%b Sel=%b | Actual Y=%b | Expected Y=%b",
                    test_Din, test_Sel, Y, expected_Y
                );

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
        $display("       1:8 DEMULTIPLEXER TEST");
        $display("------------------------------------------");

        // Test Din = 0 for all selection combinations
        for (i = 0; i < 8; i = i + 1) begin
            check_demux(1'b0, i);
        end

        // Test Din = 1 for all selection combinations
        for (j = 0; j < 8; j = j + 1) begin
            check_demux(1'b1, j);
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
