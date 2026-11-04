# 4:2 Binary Encoder using SystemVerilog

## Overview

This project implements a **4:2 Binary Encoder** using synthesizable SystemVerilog.

A binary encoder is a combinational logic circuit that converts one active input line out of four into a 2-bit binary output.

This implementation also includes a `Valid` status output, which indicates whether exactly one input is HIGH.

The design was simulated and verified using **QuestaSim 10.7c** with a self-checking SystemVerilog testbench.

## Design Specifications

| Parameter | Description |
|---|---|
| Circuit | 4:2 Binary Encoder |
| Design type | Combinational logic |
| HDL | SystemVerilog |
| Data inputs | 4 |
| Encoded outputs | 2 |
| Status output | 1 (`Valid`) |
| Simulator | QuestaSim 10.7c |

## Input and Output Signals

**Inputs**
- `D0`
- `D1`
- `D2`
- `D3`

**Outputs**
- `Y1` – Most significant encoded bit
- `Y0` – Least significant encoded bit
- `Valid` – Indicates a valid one-hot input pattern

## Truth Table

The encoder assumes exactly one input is HIGH at a time.

| D3 | D2 | D1 | D0 | Y1 | Y0 | Valid |
|---:|---:|---:|---:|---:|---:|---:|
| 0 | 0 | 0 | 1 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 0 | 1 | 1 | 1 |

## Invalid Input Conditions

The following conditions are treated as invalid:
- No input is HIGH (`0000`).
- More than one input is HIGH.

For these conditions, the design produces:

`Y1 = 0, Y0 = 0, Valid = 0`

This is a basic encoder, not a priority encoder.

## Boolean Expressions

For valid one-hot input combinations:

- `Y1 = D2 OR D3`
- `Y0 = D1 OR D3`

The RTL implementation uses a `case` statement to identify valid input patterns and generate the encoded output and validity status.

## RTL Implementation

The design uses:
- `logic` data types.
- `always_comb` for combinational logic.
- Concatenation `{D3, D2, D1, D0}`.
- `case` statements for input pattern detection.
- Default assignments for defined outputs and latch avoidance.

## Verification Methodology

A self-checking SystemVerilog testbench was developed.

Verification features:
- Exhaustive testing of all 16 possible input combinations.
- Independent reference model.
- Case inequality (`!==`) comparison.
- Automatic PASS and FAIL counters.
- Verification of zero-active and multiple-active invalid patterns.
- Overall simulation status reporting.

## Simulation Results

| Metric | Result |
|---|---:|
| Total test cases | 16 |
| Passed | 16 |
| Failed | 0 |
| Overall status | ALL TESTS PASSED |

*The results above should match the actual QuestaSim Transcript.*

## Waveform

The simulation waveform is available at:

`simulation/waveform.png`

## Project Structure

```text
12_4to2_encoder/
│
├── rtl/
│   └── encoder_4to2.sv
│
├── testbench/
│   └── encoder_4to2_tb.sv
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

- Understanding binary encoder operation.
- Implementing combinational logic using SystemVerilog.
- Understanding one-hot encoding.
- Handling invalid input combinations.
- Using status signals such as `Valid`.
- Writing self-checking testbenches.
- Performing exhaustive functional verification.
- Analyzing simulation waveforms.

## Author

**Preetkumar Kayasth**

ECE | VLSI Design and Verification

GitHub: [preetkumarkayasth](https://github.com/preetkumarkayasth)