
module demux_1to8 (
    input  logic       Din,
    input  logic [2:0] Sel,
    output logic [7:0] Y
);

    always_comb begin
        Y = 8'b0000_0000;

        case (Sel)
            3'b000: Y[0] = Din;
            3'b001: Y[1] = Din;
            3'b010: Y[2] = Din;
            3'b011: Y[3] = Din;
            3'b100: Y[4] = Din;
            3'b101: Y[5] = Din;
            3'b110: Y[6] = Din;
            3'b111: Y[7] = Din;

            default: Y = 8'b0000_0000;
        endcase
    end

endmodule
