
module sr_latch_nor (
    input  logic S,
    input  logic R,
    output logic Q,
    output logic Q_bar
);

    always_latch begin

        if (S && R) begin
            // Invalid condition for a NOR-based SR latch
            Q     = 1'b0;
            Q_bar = 1'b0;
        end

        else if (S) begin
            // Set condition
            Q     = 1'b1;
            Q_bar = 1'b0;
        end

        else if (R) begin
            // Reset condition
            Q     = 1'b0;
            Q_bar = 1'b1;
        end

        // S=0, R=0:
        // No assignment means the previous state is retained.

    end

endmodule
