# Full Adder Using SystemVerilog

## 1. Project Overview

This project implements a 1-bit Full Adder using SystemVerilog HDL. The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective

To perform binary addition of three 1-bit inputs (A, B and Cin) and generate Sum and Carry-out (Cout).

## 3. Boolean Expressions

- **Sum:** A XOR B XOR Cin
- **Carry-out:** AB + BCin + ACin

## 4. Truth Table

| A | B | Cin | Sum | Cout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

## 5. Tools and Technologies

| Parameter | Details |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Methodology | Dataflow Modeling |
| Verification | Self-checking Testbench |

## 6. Project Structure

```text
03_full_adder/
├── rtl/
│   └── full_adder.sv
├── testbench/
│   └── full_adder_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 7. Verification Methodology

- All eight possible input combinations are applied.
- Each input combination is held for 10 ns.
- Actual outputs are compared with expected outputs.
- PASS/FAIL status is reported for each test case.

## 8. Simulation Results

| Parameter | Result |
|---|---|
| Total Test Cases | 8 |
| Passed | 8 |
| Failed | 0 |
| Overall Status | PASS |

## 9. Conclusion

The Full Adder was successfully designed and verified using SystemVerilog HDL. The simulation verifies correct Sum and Carry-out generation for all eight input combinations.