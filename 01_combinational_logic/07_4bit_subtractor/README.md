# 4-Bit Ripple Borrow Subtractor

## Overview
This project implements a 4-bit ripple borrow subtractor using SystemVerilog. It performs binary subtraction of two 4-bit operands along with an input borrow.

The design uses four cascaded full-subtractor stages, where the borrow output of each stage is propagated to the next stage.

## Design Specifications
- **HDL:** SystemVerilog
- **Simulator:** QuestaSim 10.7c
- **Design Type:** Combinational Logic
- **Architecture:** Ripple Borrow Subtractor
- **Operand Width:** 4 bits

## Inputs and Outputs

| Signal | Direction | Width | Description |
|---|---|---|---|
| A | Input | 4 bits | Minuend |
| B | Input | 4 bits | Subtrahend |
| Bin | Input | 1 bit | Initial borrow input |
| Difference | Output | 4 bits | Subtraction result |
| Bout | Output | 1 bit | Final borrow output |

## Boolean Expressions

For each bit position:

**Difference:**

D = A XOR B XOR Bin

**Borrow output:**

Bout = (~A · B) + (~A · Bin) + (B · Bin)

The borrow output of each stage is connected to the next stage.

## Project Structure

```text
07_4bit_subtractor/
├── rtl/
│   └── four_bit_subtractor.sv
├── testbench/
│   └── four_bit_subtractor_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Test Cases

The testbench verifies eight directed test cases:

1. Zero minus zero
2. Basic subtraction
3. Equal operands
4. Borrow generation
5. Subtraction with borrow input
6. Zero minus one
7. Maximum operand minus zero
8. Borrow propagation

The testbench uses an independent arithmetic reference calculation to check the DUT outputs.

## Simulation Results

Expected verification summary:

- Total test cases: 8
- Passed: 8
- Failed: 0
- Overall result: All tests passed

## Waveform

The `simulation/waveform.png` file contains the simulated input and output waveforms.

## Learning Outcomes

- Understanding binary subtraction.
- Understanding full-subtractor logic.
- Learning ripple borrow propagation.
- Writing synthesizable SystemVerilog RTL.
- Developing a self-checking testbench.
- Simulating and verifying combinational circuits using QuestaSim.

## Author
Preetkumar Kayasth