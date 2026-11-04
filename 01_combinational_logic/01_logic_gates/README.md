# Implementation of 7 Basic Logic Gates Using SystemVerilog

## 1. Project Overview

This project implements the seven fundamental digital logic gates using SystemVerilog HDL. The design is verified using a self-checking testbench and simulated using QuestaSim 10.7c.

## 2. Objective

To design and verify the functionality of the following seven basic logic gates:

- AND Gate
- OR Gate
- NOT Gate
- NAND Gate
- NOR Gate
- XOR Gate
- XNOR Gate

## 3. Tools and Technologies

| Parameter | Details |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Methodology | Dataflow Modeling |
| Verification | Self-checking Testbench |
| Version Control | Git and GitHub |

## 4. Logic Expressions

| Logic Gate | Boolean Expression |
|---|---|
| AND | Y = A · B |
| OR | Y = A + B |
| NOT | Y = A' |
| NAND | Y = (A · B)' |
| NOR | Y = (A + B)' |
| XOR | Y = A ⊕ B |
| XNOR | Y = (A ⊕ B)' |

## 5. Truth Table

| A | B | AND | OR | NOT A | NAND | NOR | XOR | XNOR |
|---|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 0 | 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 1 |

Note: The NOT gate operates only on input A.

## 6. Project Structure

```text
01_logic_gates/
│
├── rtl/
│   └── logic_gates.sv
│
├── testbench/
│   └── logic_gates_tb.sv
│
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
│
└── README.md
```

## 7. Verification Methodology

A SystemVerilog self-checking testbench is used to verify the design.

- All four possible combinations of inputs A and B are applied.
- A delay of 10 ns is introduced between successive test cases.
- Expected outputs are calculated independently.
- Actual outputs are compared against expected outputs.
- PASS or FAIL is reported for each test case.

## 8. Simulation Results

| Parameter | Result |
|---|---|
| Total Test Cases | 4 |
| Passed | 4 |
| Failed | 0 |
| Overall Status | PASS |

All seven logic gates produced the expected outputs for every tested input combination.

## 9. Waveform

The simulation waveform is available in the `simulation/` directory as `waveform.png`.

## 10. Conclusion

Successfully designed and verified all seven fundamental digital logic gates using SystemVerilog HDL. The simulation results confirm the correct functionality of the implemented logic gates.

---

**Project Status:** Successfully Completed