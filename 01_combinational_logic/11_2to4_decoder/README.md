# 2:4 Binary Decoder using SystemVerilog

## Overview

This project implements a **2:4 Binary Decoder** using synthesizable SystemVerilog.

A decoder is a combinational logic circuit that converts an n-bit binary input into up to 2ⁿ unique output lines. For this design, two input bits select exactly one of four outputs.

The design was simulated and functionally verified using **QuestaSim 10.7c** with a self-checking SystemVerilog testbench.

## Design Specifications

| Parameter | Description |
|---|---|
| Circuit | 2:4 Binary Decoder |
| Design type | Combinational logic |
| HDL | SystemVerilog |
| Number of inputs | 2 |
| Number of outputs | 4 |
| Simulator | QuestaSim 10.7c |

## Input and Output Signals

**Inputs**
- `A` – Most significant input bit
- `B` – Least significant input bit

**Outputs**
- `Y0`
- `Y1`
- `Y2`
- `Y3`

## Truth Table

| A | B | Y0 | Y1 | Y2 | Y3 |
|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 0 | 1 |

## Boolean Expressions

- `Y0 = NOT A AND NOT B`
- `Y1 = NOT A AND B`
- `Y2 = A AND NOT B`
- `Y3 = A AND B`

## RTL Implementation

The decoder uses:
- `logic` data types.
- `always_comb` for combinational logic.
- `{A, B}` concatenation to form the 2-bit input.
- `case` statements for output decoding.
- Default output assignments to avoid unintended latch inference.

## Verification Methodology

A self-checking SystemVerilog testbench was developed.

Verification features:
- Exhaustive testing of all 4 possible input combinations.
- Independent reference model for expected outputs.
- Case inequality (`!==`) for comparison.
- Automatic PASS and FAIL counters.
- Overall simulation status reporting.

## Simulation Results

| Metric | Result |
|---|---:|
| Total test cases | 4 |
| Passed | 4 |
| Failed | 0 |
| Overall status | ALL TESTS PASSED |

*The results above are based on the simulation report and should match the actual QuestaSim Transcript.*

## Waveform

The simulation waveform is available at:

`simulation/waveform.png`

## Project Structure

```text
11_2to4_decoder/
│
├── rtl/
│   └── decoder_2to4.sv
│
├── testbench/
│   └── decoder_2to4_tb.sv
│
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
│
└── README.md
```

## Tools Used

- SystemVerilog
- QuestaSim 10.7c
- Notepad
- Git and GitHub

## Key Learning Outcomes

- Understanding binary decoder operation.
- Implementing combinational logic using SystemVerilog.
- Using `always_comb` and `case` constructs.
- Understanding one-hot output decoding.
- Writing self-checking testbenches.
- Performing exhaustive functional verification.
- Analyzing simulation waveforms.

## Author

**Preetkumar Kayasth**

ECE | VLSI Design and Verification

GitHub: [preetkumarkayasth](https://github.com/preetkumarkayasth)