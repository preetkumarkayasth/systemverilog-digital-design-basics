
module parity_generator_checker_8bit (
    input  logic [7:0] Data,
    input  logic       Received_Parity,

    output logic       Even_Parity,
    output logic       Odd_Parity,

    output logic       Even_Error,
    output logic       Odd_Error
);

    // Parity generation and checking
    always_comb begin

        // Generate even and odd parity bits
        Even_Parity = ^Data;
        Odd_Parity  = ~^Data;

        // Check received parity
        // Even parity: XOR of all bits must be 0
        Even_Error = ^{Data, Received_Parity};

        // Odd parity: XOR of all bits must be 1
        Odd_Error = ~^{Data, Received_Parity};

    end

endmodule
