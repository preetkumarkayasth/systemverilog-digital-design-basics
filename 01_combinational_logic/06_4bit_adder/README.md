# 4-bit Ripple Carry Adder Using SystemVerilog

## 1. Project Overview

This project implements a 4-bit Ripple Carry Adder using SystemVerilog HDL. The architecture consists of four cascaded Full Adder stages.

The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective

To add two 4-bit binary numbers along with an input carry and generate a 4-bit Sum and final Carry-out.

## 3. Inputs and Outputs

| Signal | Description |
|---|---|
| A[3:0] | First 4-bit operand |
| B[3:0] | Second 4-bit operand |
| Cin | Initial carry input |
| Sum[3:0] | 4-bit addition result |
| Cout | Final carry output |

## 4. Architecture

The design uses four Full Adder stages connected in a ripple-carry configuration.

Each stage calculates one Sum bit and generates a carry for the next stage.

The final carry is connected to Cout.

## 5. Arithmetic Operation

The overall operation is:

{Cout, Sum} = A + B + Cin

## 6. Tools and Technologies

| Parameter | Details |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Architecture | Ripple Carry Adder |
| Design Methodology | Structural / Dataflow |
| Verification | Self-checking Testbench |

## 7. Project Structure

```text
06_4bit_adder/
├── rtl/
│   └── four_bit_adder.sv
├── testbench/
│   └── four_bit_adder_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 8. Verification Methodology

- Eight directed test vectors are applied.
- The testbench uses an independent arithmetic reference model.
- Actual outputs are compared against expected outputs.
- PASS/FAIL status is reported for each test case.

## 9. Simulation Results

| Parameter | Result |
|---|---|
| Total Test Cases | 8 |
| Passed | 8 |
| Failed | 0 |
| Overall Status | PASS |

## 10. Conclusion

The 4-bit Ripple Carry Adder was designed using four cascaded Full Adder stages and verified using SystemVerilog. The simulation validates correct addition and carry propagation for the tested input combinations.