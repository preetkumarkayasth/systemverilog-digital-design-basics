`timescale 1ns/1ps

module half_subtractor_tb;

    logic A, B;
    logic Difference, Borrow;

    logic [1:0] expected;

    integer i;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    half_subtractor DUT (
        .A(A),
        .B(B),
        .Difference(Difference),
        .Borrow(Borrow)
    );

    initial begin

        $display("--------------------------------------");
        $display("       HALF SUBTRACTOR TEST");
        $display("--------------------------------------");
        $display("A B | Difference Borrow | Status");
        $display("--------------------------------------");

        for (i = 0; i < 4; i = i + 1) begin

            {A, B} = i;
            #10;

            // Expected outputs
            expected[1] = A ^ B;
            expected[0] = (~A) & B;

            if ({Difference, Borrow} !== expected) begin

                $display("%b %b |     %b        %b    | FAIL",
                         A, B, Difference, Borrow);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b |     %b        %b    | PASS",
                         A, B, Difference, Borrow);

                pass_count = pass_count + 1;

            end

        end

        $display("--------------------------------------");
        $display("Total Tests : 4");
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