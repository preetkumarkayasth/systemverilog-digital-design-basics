
`timescale 1ns/1ps

module decoder_2to4_tb;

    logic A, B;

    logic Y0, Y1, Y2, Y3;

    logic [3:0] expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;

    integer i;

    // DUT Instantiation
    decoder_2to4 DUT (
        .A(A),
        .B(B),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin

        $display("==============================================");
        $display("          2:4 DECODER VERIFICATION");
        $display("==============================================");
        $display("A B | Y0 Y1 Y2 Y3 | Expected | Status");
        $display("----------------------------------------------");

        // Exhaustive testing of all 4 input combinations
        for (i = 0; i < 4; i = i + 1) begin

            {A, B} = i;

            #10;

            // Independent reference model
            expected_Y = 4'b0000;

            case ({A, B})
                2'b00: expected_Y[0] = 1'b1;
                2'b01: expected_Y[1] = 1'b1;
                2'b10: expected_Y[2] = 1'b1;
                2'b11: expected_Y[3] = 1'b1;
                default: expected_Y = 4'b0000;
            endcase

            // Compare actual and expected outputs
            if ({Y3, Y2, Y1, Y0} !== expected_Y) begin

                $display("%b %b | %b  %b  %b  %b | %b | FAIL",
                         A, B, Y0, Y1, Y2, Y3, expected_Y);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b | %b  %b  %b  %b | %b | PASS",
                         A, B, Y0, Y1, Y2, Y3, expected_Y);

                pass_count = pass_count + 1;

            end

        end

        $display("----------------------------------------------");
        $display("TOTAL TESTS        : %0d", pass_count + fail_count);
        $display("TOTAL TESTS PASSED : %0d", pass_count);
        $display("TOTAL TESTS FAILED : %0d", fail_count);
        $display("==============================================");

        if (fail_count == 0)
            $display("OVERALL RESULT: ALL TESTS PASSED");
        else
            $display("OVERALL RESULT: TESTS FAILED");

        $finish;

    end

endmodule
