
`timescale 1ns/1ps

module d_flip_flop_tb;

    logic clk;
    logic reset;
    logic D;

    logic Q;
    logic Q_bar;

    integer pass_count = 0;
    integer fail_count = 0;

    // DUT instantiation
    d_flip_flop DUT (
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Self-checking task
    task automatic check_output(
        input logic expected_Q,
        input logic expected_Q_bar,
        input string test_name
    );
        begin
            #1;

            if ((Q === expected_Q) &&
                (Q_bar === expected_Q_bar)) begin

                $display("PASS: %s | Q=%b Q_bar=%b",
                         test_name, Q, Q_bar);
                pass_count++;
            end
            else begin
                $display("FAIL: %s | Expected Q=%b Q_bar=%b | Got Q=%b Q_bar=%b",
                         test_name, expected_Q, expected_Q_bar,
                         Q, Q_bar);
                fail_count++;
            end
        end
    endtask

    initial begin

        $display("----------------------------------------");
        $display("       D FLIP-FLOP TESTBENCH");
        $display("----------------------------------------");

        // Initialize inputs
        reset = 1'b0;
        D = 1'b0;

        // Test 1: Asynchronous reset
        #2;
        reset = 1'b1;
        check_output(1'b0, 1'b1, "Asynchronous Reset");

        // Test 2: Release reset and capture D=1
        #2;
        reset = 1'b0;
        D = 1'b1;
        @(posedge clk);
        check_output(1'b1, 1'b0, "Capture Data 1");

        // Test 3: Change D between clock edges
        #1;
        D = 1'b0;
        check_output(1'b1, 1'b0, "Hold When D Changes");

        // Test 4: Capture D=0 at next rising edge
        @(posedge clk);
        check_output(1'b0, 1'b1, "Capture Data 0");

        // Test 5: Change D to 1 without clock edge
        #1;
        D = 1'b1;
        check_output(1'b0, 1'b1, "Retain Previous Data");

        // Test 6: Capture D=1 at next rising edge
        @(posedge clk);
        check_output(1'b1, 1'b0, "Capture Data 1 Again");

        // Test 7: Asynchronous reset while Q=1
        #2;
        reset = 1'b1;
        check_output(1'b0, 1'b1, "Reset Without Clock Edge");

        // Test 8: Hold reset state after releasing reset
        #2;
        reset = 1'b0;
        check_output(1'b0, 1'b1, "Hold After Reset Release");

        // Test 9: Capture D=1 again
        D = 1'b1;
        @(posedge clk);
        check_output(1'b1, 1'b0, "Capture After Reset");

        // Test 10: Verify complementary output
        #1;
        if (Q_bar === ~Q) begin
            $display("PASS: Complementary Output Check");
            pass_count++;
        end
        else begin
            $display("FAIL: Complementary Output Check");
            fail_count++;
        end

        // Final report
        $display("----------------------------------------");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("PASS        : %0d", pass_count);
        $display("FAIL        : %0d", fail_count);

        if (fail_count == 0)
            $display("RESULT: ALL TESTS PASSED");
        else
            $display("RESULT: TESTS FAILED");

        $display("----------------------------------------");

        $finish;
    end

endmodule

