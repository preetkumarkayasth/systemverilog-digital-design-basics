
module gated_sr_latch (
    input  logic EN,
    input  logic S,
    input  logic R,

    output logic Q,
    output logic Q_bar
);

    logic S_g;
    logic R_g;

    // Gate the Set and Reset inputs
    assign S_g = EN & S;
    assign R_g = EN & R;

    // Level-sensitive SR latch
    always_latch begin

        if (S_g && R_g) begin
            // Invalid condition
            Q     = 1'b0;
            Q_bar = 1'b0;
        end

        else if (S_g) begin
            // Set
            Q     = 1'b1;
            Q_bar = 1'b0;
        end

        else if (R_g) begin
            // Reset
            Q     = 1'b0;
            Q_bar = 1'b1;
        end

        // Otherwise, retain the previous state
    end

endmodule
