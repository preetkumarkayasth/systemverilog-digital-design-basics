
`timescale 1ns/1ps

module logic_gates_tb;

    logic A, B;

    logic AND_out, OR_out, NOT_out;
    logic NAND_out, NOR_out, XOR_out, XNOR_out;

    logic [6:0] expected;
    integer i;

    // DUT Instantiation
    logic_gates DUT (
        .A(A),
        .B(B),
        .AND_out(AND_out),
        .OR_out(OR_out),
        .NOT_out(NOT_out),
        .NAND_out(NAND_out),
        .NOR_out(NOR_out),
        .XOR_out(XOR_out),
        .XNOR_out(XNOR_out)
    );

    initial begin

        $display("A B | AND OR NOT NAND NOR XOR XNOR");
        $display("----------------------------------");

        for (i = 0; i < 4; i = i + 1) begin

            {A, B} = i;
            #10;

            expected = {
                (A & B),
                (A | B),
                (~A),
                ~(A & B),
                ~(A | B),
                (A ^ B),
                ~(A ^ B)
            };

            if ({
                AND_out, OR_out, NOT_out,
                NAND_out, NOR_out, XOR_out, XNOR_out
            } !== expected) begin

                $display("FAIL: A=%b B=%b", A, B);

            end
            else begin

                $display("%b %b |  %b   %b   %b    %b    %b   %b    %b | PASS",
                    A, B, AND_out, OR_out, NOT_out,
                    NAND_out, NOR_out, XOR_out, XNOR_out);

            end

        end

        $display("----------------------------------");
        $display("Simulation completed.");

        $finish;

    end

endmodule
