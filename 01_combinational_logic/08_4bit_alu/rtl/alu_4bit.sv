
module alu_4bit (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [2:0] Opcode,

    output logic [3:0] Result,
    output logic       Carry,
    output logic       Zero
);

    logic [4:0] Temp;

    always_comb begin

        Result = 4'b0000;
        Carry  = 1'b0;
        Temp   = 5'b00000;

        case (Opcode)

            // Addition
            3'b000: begin
                Temp   = {1'b0, A} + {1'b0, B};
                Result = Temp[3:0];
                Carry  = Temp[4];
            end

            // Subtraction
            3'b001: begin
                Temp   = {1'b0, A} - {1'b0, B};
                Result = Temp[3:0];
                Carry  = (A < B);
            end

            // AND
            3'b010: Result = A & B;

            // OR
            3'b011: Result = A | B;

            // XOR
            3'b100: Result = A ^ B;

            // NOT A
            3'b101: Result = ~A;

            // NAND
            3'b110: Result = ~(A & B);

            // NOR
            3'b111: Result = ~(A | B);

            default: begin
                Result = 4'b0000;
                Carry  = 1'b0;
            end

        endcase

        Zero = (Result == 4'b0000);

    end

endmodule
