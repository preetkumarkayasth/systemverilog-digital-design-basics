
`timescale 1ns/1ps

module mux_16to1_tb;

    logic [15:0] D;
    logic [3:0]  Sel;
    logic        Y;

    logic        expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i, j;

    // DUT instantiation
    mux_16to1 DUT (
        .D   (D),
        .Sel (Sel),
        .Y   (Y)
    );

    // Task to check one input pattern across all select values
    task automatic check_mux(input logic [15:0] test_D);
        begin
            D = test_D;

            for (integer k = 0; k < 16; k = k + 1) begin
                Sel = k;
                #10;

                expected_Y = test_D[k];

                if (Y !== expected_Y) begin
                    $display(
                        "FAIL: D=%b | Sel=%0d | Actual Y=%b | Expected Y=%b",
                        D, Sel, Y, expected_Y
                    );
                    fail_count = fail_count + 1;
                end
                else begin
                    pass_count = pass_count + 1;
                end
            end
        end
    endtask

    initial begin
        $display("------------------------------------------");
        $display("          16:1 MUX TEST");
        $display("------------------------------------------");

        // Pattern 1: All zeros
        check_mux(16'h0000);

        // Pattern 2: All ones
        check_mux(16'hFFFF);

        // Pattern 3: Alternating 1010
        check_mux(16'hAAAA);

        // Pattern 4: Alternating 0101
        check_mux(16'h5555);

        // Pattern 5: Walking one
        for (i = 0; i < 16; i = i + 1)
            check_mux(16'h0001 << i);

        // Pattern 6: Walking zero
        for (i = 0; i < 16; i = i + 1)
            check_mux(~(16'h0001 << i));

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
