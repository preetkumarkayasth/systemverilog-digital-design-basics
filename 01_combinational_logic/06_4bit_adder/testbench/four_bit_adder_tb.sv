`timescale 1ns/1ps

module four_bit_adder_tb;

    logic [3:0] A, B;
    logic Cin;

    logic [3:0] Sum;
    logic Cout;

    logic [4:0] expected;

    integer i;
    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    four_bit_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test vectors
    initial begin

        $display("------------------------------------------");
        $display("          4-BIT ADDER TEST");
        $display("------------------------------------------");
        $display(" A     B    Cin | Cout Sum | Status");
        $display("------------------------------------------");

        // Test 1: Zero + Zero
        A = 4'b0000; B = 4'b0000; Cin = 0;

        // Test 2: Basic addition
        #10 A = 4'b0101; B = 4'b0011; Cin = 0;

        // Test 3: Carry generation
        #10 A = 4'b1111; B = 4'b0001; Cin = 0;

        // Test 4: Maximum addition
        #10 A = 4'b1111; B = 4'b1111; Cin = 0;

        // Test 5: Addition with carry input
        #10 A = 4'b0101; B = 4'b0011; Cin = 1;

        // Test 6: Carry propagation
        #10 A = 4'b0111; B = 4'b0001; Cin = 1;

        // Test 7: Unequal operands
        #10 A = 4'b1010; B = 4'b0101; Cin = 0;

        // Test 8: All ones with carry input
        #10 A = 4'b1111; B = 4'b1111; Cin = 1;

        // Allow final test vector to settle
        #10;

        $display("------------------------------------------");
        $display("Simulation stimulus completed.");
        $display("------------------------------------------");

        $finish;

    end

    // Independent checking process
    always @(A or B or Cin) begin

        #1;

        expected = {1'b0, A} + {1'b0, B} + Cin;

        if (!$isunknown({A, B, Cin})) begin

            if ({Cout, Sum} !== expected) begin

                $display("FAIL: A=%b B=%b Cin=%b Expected=%b Actual=%b",
                         A, B, Cin, expected, {Cout, Sum});

                fail_count = fail_count + 1;

            end
            else begin

                $display("%b %b  %b  |  %b    %b | PASS",
                         A, B, Cin, Cout, Sum);

                pass_count = pass_count + 1;

            end

        end

    end

endmodule