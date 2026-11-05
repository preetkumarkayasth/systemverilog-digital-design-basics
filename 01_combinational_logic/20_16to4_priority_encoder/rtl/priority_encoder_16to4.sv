
module priority_encoder_16to4 (
    input  logic [15:0] D,
    output logic [3:0]  Y,
    output logic        Valid
);

    always_comb begin
        Y     = 4'b0000;
        Valid = 1'b0;

        if (D[15]) begin
            Y     = 4'd15;
            Valid = 1'b1;
        end
        else if (D[14]) begin
            Y     = 4'd14;
            Valid = 1'b1;
        end
        else if (D[13]) begin
            Y     = 4'd13;
            Valid = 1'b1;
        end
        else if (D[12]) begin
            Y     = 4'd12;
            Valid = 1'b1;
        end
        else if (D[11]) begin
            Y     = 4'd11;
            Valid = 1'b1;
        end
        else if (D[10]) begin
            Y     = 4'd10;
            Valid = 1'b1;
        end
        else if (D[9]) begin
            Y     = 4'd9;
            Valid = 1'b1;
        end
        else if (D[8]) begin
            Y     = 4'd8;
            Valid = 1'b1;
        end
        else if (D[7]) begin
            Y     = 4'd7;
            Valid = 1'b1;
        end
        else if (D[6]) begin
            Y     = 4'd6;
            Valid = 1'b1;
        end
        else if (D[5]) begin
            Y     = 4'd5;
            Valid = 1'b1;
        end
        else if (D[4]) begin
            Y     = 4'd4;
            Valid = 1'b1;
        end
        else if (D[3]) begin
            Y     = 4'd3;
            Valid = 1'b1;
        end
        else if (D[2]) begin
            Y     = 4'd2;
            Valid = 1'b1;
        end
        else if (D[1]) begin
            Y     = 4'd1;
            Valid = 1'b1;
        end
        else if (D[0]) begin
            Y     = 4'd0;
            Valid = 1'b1;
        end
    end

endmodule
