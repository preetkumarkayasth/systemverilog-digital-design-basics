# Half Adder Using SystemVerilog

## 1. Project Overview
This project implements a 1-bit Half Adder using SystemVerilog HDL. The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective
To perform binary addition of two 1-bit inputs and generate Sum and Carry outputs.

## 3. Boolean Expressions

- **Sum:** \(A \oplus B\)
- **Carry:** \(A \cdot B\)

## 4. Truth Table

| A | B | Sum | Carry |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## 5. Tools and Technologies

| Parameter | Details |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Methodology | Dataflow Modeling |
| Verification | Self-checking Testbench |

## 6. Project Structure

```text
02_half_adder/
├── rtl/
│   └── half_adder.sv
├── testbench/
│   └── half_adder_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 7. Verification
All four possible input combinations were applied. The testbench compared the DUT outputs against expected results.

## 8. Simulation Results

| Parameter | Result |
|---|---|
| Total Test Cases | 4 |
| Passed | 4 |
| Failed | 0 |
| Overall Status | PASS |

## 9. Conclusion
The Half Adder was successfully designed and verified using SystemVerilog. All four test cases passed, confirming the correct Sum and Carry functionality.