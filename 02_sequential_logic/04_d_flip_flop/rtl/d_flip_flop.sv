
module d_flip_flop (
    input  logic clk,
    input  logic reset,
    input  logic D,

    output logic Q,
    output logic Q_bar
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end

    assign Q_bar = ~Q;

endmodule
