
module encoder_4to2 (

    input  logic D0,
    input  logic D1,
    input  logic D2,
    input  logic D3,

    output logic Y1,
    output logic Y0,
    output logic Valid

);

    always_comb begin

        // Default outputs
        Y1    = 1'b0;
        Y0    = 1'b0;
        Valid = 1'b0;

        // Encode the active input
        case ({D3, D2, D1, D0})

            4'b0001: begin
                Y1    = 1'b0;
                Y0    = 1'b0;
                Valid = 1'b1;
            end

            4'b0010: begin
                Y1    = 1'b0;
                Y0    = 1'b1;
                Valid = 1'b1;
            end

            4'b0100: begin
                Y1    = 1'b1;
                Y0    = 1'b0;
                Valid = 1'b1;
            end

            4'b1000: begin
                Y1    = 1'b1;
                Y0    = 1'b1;
                Valid = 1'b1;
            end

            default: begin
                Y1    = 1'b0;
                Y0    = 1'b0;
                Valid = 1'b0;
            end

        endcase

    end

endmodule
