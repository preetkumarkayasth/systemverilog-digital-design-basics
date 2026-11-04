
`timescale 1ns/1ps

module alu_4bit_tb;

    logic [3:0] A, B;
    logic [2:0] Opcode;

    logic [3:0] Result;
    logic Carry, Zero;

    logic [4:0] expected_temp;
    logic [3:0] expected_result;
    logic expected_carry;
    logic expected_zero;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT Instantiation
    alu_4bit DUT (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero)
    );

    // Task to verify DUT output
    task automatic check_result;
        begin
            case (Opcode)

                3'b000: begin
                    expected_temp = {1'b0, A} + {1'b0, B};
                    expected_result = expected_temp[3:0];
                    expected_carry = expected_temp[4];
                end

                3'b001: begin
                    expected_temp = {1'b0, A} - {1'b0, B};
                    expected_result = expected_temp[3:0];
                    expected_carry = (A < B);
                end

                3'b010: begin
                    expected_result = A & B;
                    expected_carry = 0;
                end

                3'b011: begin
                    expected_result = A | B;
                    expected_carry = 0;
                end

                3'b100: begin
                    expected_result = A ^ B;
                    expected_carry = 0;
                end

                3'b101: begin
                    expected_result = ~A;
                    expected_carry = 0;
                end

                3'b110: begin
                    expected_result = ~(A & B);
                    expected_carry = 0;
                end

                3'b111: begin
                    expected_result = ~(A | B);
                    expected_carry = 0;
                end

                default: begin
                    expected_result = 0;
                    expected_carry = 0;
                end

            endcase

            expected_zero = (expected_result == 0);

            if ({Carry, Result, Zero} !==
                {expected_carry, expected_result, expected_zero}) begin

                $display("FAIL: A=%b B=%b Opcode=%b Expected=%b Actual=%b",
                         A, B, Opcode,
                         {expected_carry, expected_result, expected_zero},
                         {Carry, Result, Zero});

                fail_count = fail_count + 1;

            end
            else begin

                $display("A=%b B=%b Opcode=%b | Carry=%b Result=%b Zero=%b | PASS",
                         A, B, Opcode, Carry, Result, Zero);

                pass_count = pass_count + 1;

            end
        end
    endtask

    initial begin

        $display("================================================");
        $display("          4-BIT ALU VERIFICATION");
        $display("================================================");

        // ADD
        Opcode = 3'b000; A = 4'b0101; B = 4'b0011;
        #10; check_result();

        Opcode = 3'b000; A = 4'b1111; B = 4'b0001;
        #10; check_result();

        // SUB
        Opcode = 3'b001; A = 4'b1000; B = 4'b0011;
        #10; check_result();

        Opcode = 3'b001; A = 4'b0011; B = 4'b1000;
        #10; check_result();

        // AND
        Opcode = 3'b010; A = 4'b1100; B = 4'b1010;
        #10; check_result();

        // OR
        Opcode = 3'b011; A = 4'b1100; B = 4'b1010;
        #10; check_result();

        // XOR
        Opcode = 3'b100; A = 4'b1100; B = 4'b1010;
        #10; check_result();

        // NOT
        Opcode = 3'b101; A = 4'b1010; B = 4'b0000;
        #10; check_result();

        // NAND
        Opcode = 3'b110; A = 4'b1100; B = 4'b1010;
        #10; check_result();

        // NOR
        Opcode = 3'b111; A = 4'b1100; B = 4'b1010;
        #10; check_result();

        // Zero flag test
        Opcode = 3'b100; A = 4'b1010; B = 4'b1010;
        #10; check_result();

        $display("================================================");
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
add wave -r sim:/alu_4bit_tb/*