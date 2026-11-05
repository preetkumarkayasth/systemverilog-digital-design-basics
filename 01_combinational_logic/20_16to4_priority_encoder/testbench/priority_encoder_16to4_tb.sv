
`timescale 1ns/1ps

module priority_encoder_16to4_tb;

    logic [15:0] D;
    logic [3:0]  Y;
    logic        Valid;

    logic [3:0] expected_Y;
    logic       expected_Valid;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i;

    // DUT instantiation
    priority_encoder_16to4 DUT (
        .D     (D),
        .Y     (Y),
        .Valid (Valid)
    );

    // Independent reference model
    task automatic check_encoder(input logic [15:0] test_D);
        integer k;
        begin
            D = test_D;

            expected_Y     = 4'b0000;
            expected_Valid = 1'b0;

            // Find the highest-indexed HIGH input
            for (k = 0; k < 16; k = k + 1) begin
                if (test_D[k]) begin
                    expected_Y     = k;
                    expected_Valid = 1'b1;
                end
            end

            #10;

            if ((Y !== expected_Y) ||
                (Valid !== expected_Valid)) begin

                $display(
                    "FAIL: D=%b | Actual Y=%b Valid=%b | Expected Y=%b Valid=%b",
                    test_D, Y, Valid, expected_Y, expected_Valid
                );

                fail_count = fail_count + 1;
            end
            else begin
                pass_count = pass_count + 1;
            end
        end
    endtask

    initial begin
        $display("------------------------------------------");
        $display("       16:4 PRIORITY ENCODER TEST");
        $display("------------------------------------------");

        // Test 1: No input active
        check_encoder(16'h0000);

        // Test 2: Every input tested individually
        for (i = 0; i < 16; i = i + 1)
            check_encoder(16'h0001 << i);

        // Test 3: All inputs HIGH
        check_encoder(16'hFFFF);

        // Test 4: Alternating patterns
        check_encoder(16'hAAAA);
        check_encoder(16'h5555);

        // Test 5: Multiple simultaneous HIGH inputs
        check_encoder(16'h8001);
        check_encoder(16'h8204);
        check_encoder(16'hA500);
        check_encoder(16'h0109);
        check_encoder(16'hF00F);
        check_encoder(16'h4444);
        check_encoder(16'h00FF);

        // Test 6: Walking-zero patterns
        for (i = 0; i < 16; i = i + 1)
            check_encoder(~(16'h0001 << i));

        $display("------------------------------------------");
        $display("             TEST SUMMARY");
        $display("------------------------------------------");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT      : ALL TESTS PASSED");
        else
            $display("RESULT      : TESTS FAILED");

        $display("------------------------------------------");

        $finish;
    end

endmodule
