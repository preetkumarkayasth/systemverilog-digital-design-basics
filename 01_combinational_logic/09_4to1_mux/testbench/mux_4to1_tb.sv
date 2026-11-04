
`timescale 1ns/1ps

module mux_4to1_tb;

    logic I0, I1, I2, I3;
    logic [1:0] Sel;
    logic Y;

    logic expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;

    integer i;

    // DUT Instantiation
    mux_4to1 DUT (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .Sel(Sel),
        .Y(Y)
    );

    initial begin

        $display("================================================");
        $display("          4:1 MUX VERIFICATION");
        $display("================================================");
        $display("I0 I1 I2 I3 | Sel | Y | Expected | Status");
        $display("------------------------------------------------");

        // Exhaustive testing: 4 data inputs + 2 select inputs
        for (i = 0; i < 64; i = i + 1) begin

            {I0, I1, I2, I3, Sel} = i;

            #10;

            // Independent reference model
            case (Sel)
                2'b00: expected_Y = I0;
                2'b01: expected_Y = I1;
                2'b10: expected_Y = I2;
                2'b11: expected_Y = I3;
                default: expected_Y = 1'b0;
            endcase

            // Compare actual and expected output
            if (Y !== expected_Y) begin

                $display("FAIL: %b %b %b %b | %b | %b | %b | FAIL",
                         I0, I1, I2, I3, Sel, Y, expected_Y);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b  %b  %b  %b | %b | %b | %b | PASS",
                         I0, I1, I2, I3, Sel, Y, expected_Y);

                pass_count = pass_count + 1;

            end

        end

        $display("================================================");
        $display("TOTAL TESTS       : %0d", pass_count + fail_count);
        $display("TOTAL TESTS PASSED: %0d", pass_count);
        $display("TOTAL TESTS FAILED: %0d", fail_count);
        $display("================================================");

        if (fail_count == 0)
            $display("OVERALL RESULT: ALL TESTS PASSED");
        else
            $display("OVERALL RESULT: TESTS FAILED");

        $finish;

    end

endmodule
