
`timescale 1ns/1ps

module four_bit_subtractor_tb;

    logic [3:0] A, B;
    logic Bin;

    logic [3:0] Difference;
    logic Bout;

    logic [4:0] expected;

    integer pass_count = 0;
    integer fail_count = 0;

    four_bit_subtractor DUT (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Difference(Difference),
        .Bout(Bout)
    );

    task automatic check_result;
        begin
            expected = {1'b0, A} - {1'b0, B} - Bin;

            if ({Bout, Difference} !== expected) begin
                $display("FAIL: A=%b B=%b Bin=%b Expected=%b Actual=%b",
                         A, B, Bin, expected, {Bout, Difference});
                fail_count = fail_count + 1;
            end
            else begin
                $display("A=%b B=%b Bin=%b | Bout=%b Difference=%b | PASS",
                         A, B, Bin, Bout, Difference);
                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin
        $display("------------------------------------------");
        $display("       4-BIT SUBTRACTOR TEST");
        $display("------------------------------------------");

        A = 4'b0000; B = 4'b0000; Bin = 0;
        #10; check_result();

        A = 4'b1000; B = 4'b0011; Bin = 0;
        #10; check_result();

        A = 4'b1010; B = 4'b1010; Bin = 0;
        #10; check_result();

        A = 4'b0101; B = 4'b1001; Bin = 0;
        #10; check_result();

        A = 4'b1000; B = 4'b0011; Bin = 1;
        #10; check_result();

        A = 4'b0000; B = 4'b0001; Bin = 0;
        #10; check_result();

        A = 4'b1111; B = 4'b0000; Bin = 0;
        #10; check_result();

        A = 4'b0000; B = 4'b1111; Bin = 1;
        #10; check_result();

        $display("------------------------------------------");
        $display("TOTAL PASSED: %0d", pass_count);
        $display("TOTAL FAILED: %0d", fail_count);
        $display("------------------------------------------");

        if (fail_count == 0)
            $display("OVERALL RESULT: ALL TESTS PASSED");
        else
            $display("OVERALL RESULT: TESTS FAILED");

        $finish;
    end

endmodule
