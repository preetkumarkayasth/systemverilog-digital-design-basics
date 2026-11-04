`timescale 1ns/1ps

module half_adder_tb;

    logic A, B;
    logic Sum, Carry;

    logic [1:0] expected;
    integer i;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    half_adder DUT (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Carry(Carry)
    );

    initial begin

        $display("--------------------------------");
        $display("       HALF ADDER TEST");
        $display("--------------------------------");
        $display("A B | Sum Carry | Status");
        $display("--------------------------------");

        for (i = 0; i < 4; i = i + 1) begin

            {A, B} = i;
            #10;

            expected = {
                (A ^ B),
                (A & B)
            };

            if ({Sum, Carry} !== expected) begin
                $display("%b %b |  %b    %b   | FAIL",
                         A, B, Sum, Carry);
                fail_count = fail_count + 1;
            end
            else begin
                $display("%b %b |  %b    %b   | PASS",
                         A, B, Sum, Carry);
                pass_count = pass_count + 1;
            end

        end

        $display("--------------------------------");
        $display("Total Tests : 4");
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);

        if (fail_count == 0)
            $display("OVERALL STATUS: PASS");
        else
            $display("OVERALL STATUS: FAIL");

        $display("--------------------------------");

        $finish;

    end

endmodule