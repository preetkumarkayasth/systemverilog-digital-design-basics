
`timescale 1ns/1ps

module encoder_4to2_tb;

    logic D0, D1, D2, D3;

    logic Y1, Y0, Valid;

    logic [2:0] expected_output;

    integer pass_count = 0;
    integer fail_count = 0;

    integer i;

    // DUT Instantiation
    encoder_4to2 DUT (
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .Y1(Y1),
        .Y0(Y0),
        .Valid(Valid)
    );

    initial begin

        $display("================================================");
        $display("          4:2 ENCODER VERIFICATION");
        $display("================================================");
        $display("D3 D2 D1 D0 | Y1 Y0 Valid | Expected | Status");
        $display("------------------------------------------------");

        // Exhaustive testing of all 16 input combinations
        for (i = 0; i < 16; i = i + 1) begin

            {D3, D2, D1, D0} = i;

            #10;

            // Independent reference model
            expected_output = 3'b000;

            case ({D3, D2, D1, D0})

                4'b0001: expected_output = 3'b001;
                4'b0010: expected_output = 3'b011;
                4'b0100: expected_output = 3'b101;
                4'b1000: expected_output = 3'b111;

                default: expected_output = 3'b000;

            endcase

            // Compare actual and expected outputs
            if ({Y1, Y0, Valid} !== expected_output) begin

                $display("%b %b %b %b | %b %b %b | %b | FAIL",
                         D3, D2, D1, D0,
                         Y1, Y0, Valid,
                         expected_output);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b %b %b | %b %b %b | %b | PASS",
                         D3, D2, D1, D0,
                         Y1, Y0, Valid,
                         expected_output);

                pass_count = pass_count + 1;

            end

        end

        $display("------------------------------------------------");
        $display("TOTAL TESTS        : %0d", pass_count + fail_count);
        $display("TOTAL TESTS PASSED : %0d", pass_count);
        $display("TOTAL TESTS FAILED : %0d", fail_count);
        $display("================================================");

        if (fail_count == 0)
            $display("OVERALL RESULT: ALL TESTS PASSED");
        else
            $display("OVERALL RESULT: TESTS FAILED");

        $finish;

    end

endmodule
