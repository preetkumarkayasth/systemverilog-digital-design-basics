
`timescale 1ns/1ps

module mux_8to1_tb;

    logic [7:0] D;
    logic [2:0] Sel;
    logic Y;

    logic expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i, j;

    logic [7:0] test_pattern;

    // DUT instantiation
    mux_8to1 DUT (
        .D(D),
        .Sel(Sel),
        .Y(Y)
    );

    // Self-checking task
    task automatic check_mux(
        input logic [7:0] test_D,
        input logic [2:0] test_Sel
    );
        begin
            D = test_D;
            Sel = test_Sel;

            #10;

            // Independent expected-output calculation
            expected_Y = test_D[test_Sel];

            if (Y !== expected_Y) begin
                $display(
                    "FAIL: D=%b Sel=%b | Actual Y=%b | Expected Y=%b",
                    test_D, test_Sel, Y, expected_Y
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
        $display("       8:1 MULTIPLEXER TEST");
        $display("------------------------------------------");

        // Pattern 1: All zeros
        test_pattern = 8'b00000000;

        for (j = 0; j < 8; j = j + 1)
            check_mux(test_pattern, j);

        // Pattern 2: All ones
        test_pattern = 8'b11111111;

        for (j = 0; j < 8; j = j + 1)
            check_mux(test_pattern, j);

        // Pattern 3: Alternating bits
        test_pattern = 8'b10101010;

        for (j = 0; j < 8; j = j + 1)
            check_mux(test_pattern, j);

        // Pattern 4: Reverse alternating bits
        test_pattern = 8'b01010101;

        for (j = 0; j < 8; j = j + 1)
            check_mux(test_pattern, j);

        // Patterns 5-12: Walking one
        for (i = 0; i < 8; i = i + 1) begin
            test_pattern = 8'b00000001 << i;

            for (j = 0; j < 8; j = j + 1)
                check_mux(test_pattern, j);
        end

        // Patterns 13-20: Walking zero
        for (i = 0; i < 8; i = i + 1) begin
            test_pattern = ~(8'b00000001 << i);

            for (j = 0; j < 8; j = j + 1)
                check_mux(test_pattern, j);
        end

        // Patterns 21-120: Randomized data patterns
        for (i = 0; i < 100; i = i + 1) begin

            test_pattern = $urandom_range(0, 255);

            for (j = 0; j < 8; j = j + 1)
                check_mux(test_pattern, j);

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

