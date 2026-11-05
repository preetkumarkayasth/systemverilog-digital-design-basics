
module d_latch (
    input  logic D,
    input  logic EN,

    output logic Q,
    output logic Q_bar
);

    always_latch begin

        if (EN) begin
            // Transparent mode
            Q     = D;
            Q_bar = ~D;
        end

        // When EN = 0:
        // No assignment retains the previous state.

    end

endmodule
