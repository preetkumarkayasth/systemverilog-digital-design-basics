
module decoder_2to4 (

    input  logic A,
    input  logic B,

    output logic Y0,
    output logic Y1,
    output logic Y2,
    output logic Y3

);

    always_comb begin

        // Default output assignments
        Y0 = 1'b0;
        Y1 = 1'b0;
        Y2 = 1'b0;
        Y3 = 1'b0;

        // Decode the 2-bit input
        case ({A, B})

            2'b00: Y0 = 1'b1;
            2'b01: Y1 = 1'b1;
            2'b10: Y2 = 1'b1;
            2'b11: Y3 = 1'b1;

            default: begin
                Y0 = 1'b0;
                Y1 = 1'b0;
                Y2 = 1'b0;
                Y3 = 1'b0;
            end

        endcase

    end

endmodule
