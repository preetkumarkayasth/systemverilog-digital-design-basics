`timescale 1ns/1ps

module full_adder_tb;

    logic A, B, Cin;
    logic Sum, Cout;

    logic [1:0] expected;

    integer i;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    full_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $display("--------------------------------------");
        $display("         FULL ADDER TEST");
        $display("--------------------------------------");
        $display("A B Cin | Sum Cout | Status");
        $display("--------------------------------------");

        // Apply all 8 possible input combinations
        for (i = 0; i < 8; i = i + 1) begin

            {A, B, Cin} = i;
            #10;

            // Expected outputs
            expected[1] = A ^ B ^ Cin;
            expected[0] = (A & B) | (B & Cin) | (A & Cin);

            // Compare actual and expected outputs
            if ({Sum, Cout} !== expected) begin

                $display("%b %b  %b  |  %b    %b   | FAIL",
                         A, B, Cin, Sum, Cout);

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b  %b  |  %b    %b   | PASS",
                         A, B, Cin, Sum, Cout);

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