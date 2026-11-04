module demux_1to4 (

    input  logic       Din,
    input  logic [1:0] Sel,

    output logic Y0,
    output logic Y1,
    output logic Y2,
    output logic Y3

);

    always_comb begin

        // Default outputs
        Y0 = 1'b0;
        Y1 = 1'b0;
        Y2 = 1'b0;
        Y3 = 1'b0;

        // Route input to selected output
        case (Sel)

            2'b00: Y0 = Din;
            2'b01: Y1 = Din;
            2'b10: Y2 = Din;
            2'b11: Y3 = Din;

            default: begin
                Y0 = 1'b0;
                Y1 = 1'b0;
                Y2 = 1'b0;
                Y3 = 1'b0;
            end

        endcase

    end

endmodule