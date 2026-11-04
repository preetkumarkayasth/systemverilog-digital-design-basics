`timescale 1ns/1ps

module demux_1to4_tb;

    logic Din;
    logic [1:0] Sel;

    logic Y0, Y1, Y2, Y3;

    logic [3:0] expected_Y;

    integer pass_count = 0;
    integer fail_count = 0;

    integer i;

    // DUT Instantiation
    demux_1to4 DUT (
        .Din(Din),
        .Sel(Sel),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin

        $display("==============================================");
        $display("       1:4 DEMULTIPLEXER VERIFICATION");
        $display("==============================================");
        $display("Din | Sel | Y0 Y1 Y2 Y3 | Expected | Status");
        $display("----------------------------------------------");

        // Test all 8 possible input combinations
        for (i = 0; i < 8; i = i + 1) begin

            {Din, Sel} = i;

            #10;

            // Independent reference model
            expected_Y = 4'b0000;

            if (Din == 1'b1) begin

                case (Sel)
                    2'b00: expected_Y[0] = 1'b1;
                    2'b01: expected_Y[1] = 1'b1;
                    2'b10: expected_Y[2] = 1'b1;
                    2'b11: expected_Y[3] = 1'b1;
                    default: expected_Y = 4'b0000;
                endcase

            end

            // Compare actual and expected outputs
            if ({Y3, Y2, Y1, Y0} !== expected_Y) begin

                $display("%b   | %b  | %b  %b  %b  %b | %b | FAIL",
                         Din, Sel, Y0, Y1, Y2, Y3, expected_Y);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b   | %b  | %b  %b  %b  %b | %b | PASS",
                         Din, Sel, Y0, Y1, Y2, Y3, expected_Y);

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