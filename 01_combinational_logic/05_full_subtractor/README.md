# Full Subtractor Using SystemVerilog

## 1. Project Overview

This project implements a 1-bit Full Subtractor using SystemVerilog HDL. The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective

To subtract two 1-bit inputs, A and B, along with an incoming borrow Bin, and generate Difference and Borrow-out (Bout).

## 3. Boolean Expressions

- **Difference:** A XOR B XOR Bin
- **Borrow-out:** A'B + A'Bin + BBin

## 4. Truth Table

| A | B | Bin | Difference | Bout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 |
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
05_full_subtractor/
├── rtl/
│   └── full_subtractor.sv
├── testbench/
│   └── full_subtractor_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 7. Verification Methodology

- All eight possible input combinations are applied.
- Each combination is held for 10 ns.
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

The Full Subtractor was successfully designed and verified using SystemVerilog HDL. The simulation confirms correct Difference and Borrow-out generation for all eight input combinations.