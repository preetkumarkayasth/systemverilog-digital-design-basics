
module mux_16to1 (
    input  logic [15:0] D,
    input  logic [3:0]  Sel,
    output logic        Y
);

    always_comb begin
        case (Sel)
            4'b0000: Y = D[0];
            4'b0001: Y = D[1];
            4'b0010: Y = D[2];
            4'b0011: Y = D[3];
            4'b0100: Y = D[4];
            4'b0101: Y = D[5];
            4'b0110: Y = D[6];
            4'b0111: Y = D[7];
            4'b1000: Y = D[8];
            4'b1001: Y = D[9];
            4'b1010: Y = D[10];
            4'b1011: Y = D[11];
            4'b1100: Y = D[12];
            4'b1101: Y = D[13];
            4'b1110: Y = D[14];
            4'b1111: Y = D[15];
            default: Y = 1'b0;
        endcase
    end

endmodule
