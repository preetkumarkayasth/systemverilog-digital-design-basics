# Half Subtractor Using SystemVerilog

## 1. Project Overview

This project implements a 1-bit Half Subtractor using SystemVerilog HDL. The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective

To subtract a 1-bit input B from a 1-bit input A and generate Difference and Borrow outputs.

## 3. Boolean Expressions

- **Difference:** A XOR B
- **Borrow:** A'B

## 4. Truth Table

| A | B | Difference | Borrow |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 |

## 5. Tools and Technologies

| Parameter | Details |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Methodology | Dataflow Modeling |
| Verification | Self-checking Testbench |

## 6. Project Structure

```text
04_half_subtractor/
├── rtl/
│   └── half_subtractor.sv
├── testbench/
│   └── half_subtractor_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 7. Verification Methodology

- All four possible input combinations are applied.
- Each input combination is held for 10 ns.
- Actual outputs are compared with expected outputs.
- PASS/FAIL status is reported for each test case.

## 8. Simulation Results

| Parameter | Result |
|---|---|
| Total Test Cases | 4 |
| Passed | 4 |
| Failed | 0 |
| Overall Status | PASS |

## 9. Conclusion

The Half Subtractor was successfully designed and verified using SystemVerilog HDL. The simulation confirms correct Difference and Borrow generation for all four input combinations.