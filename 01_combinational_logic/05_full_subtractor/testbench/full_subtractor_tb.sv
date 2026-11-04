`timescale 1ns/1ps

module full_subtractor_tb;

    logic A, B, Bin;
    logic Difference, Bout;

    logic [1:0] expected;

    integer i;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    full_subtractor DUT (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Difference(Difference),
        .Bout(Bout)
    );

    initial begin

        $display("--------------------------------------");
        $display("       FULL SUBTRACTOR TEST");
        $display("--------------------------------------");
        $display("A B Bin | Difference Bout | Status");
        $display("--------------------------------------");

        // Apply all 8 input combinations
        for (i = 0; i < 8; i = i + 1) begin

            {A, B, Bin} = i;
            #10;

            // Expected outputs
            expected[1] = A ^ B ^ Bin;

            expected[0] = (~A & B) |
                          (~A & Bin) |
                          (B & Bin);

            if ({Difference, Bout} !== expected) begin

                $display("%b %b  %b  |     %b        %b   | FAIL",
                         A, B, Bin, Difference, Bout);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b  %b  |     %b        %b   | PASS",
                         A, B, Bin, Difference, Bout);

                pass_count = pass_count + 1;

            end

        end

        $display("--------------------------------------");
        $display("Total Tests : 8");
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);

        if (fail_count == 0)
            $display("OVERALL STATUS: PASS");
        else
            $display("OVERALL STATUS: FAIL");

        $display("--------------------------------------");

        $finish;

    end

endmodule