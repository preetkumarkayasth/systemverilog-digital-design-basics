# 1:8 Demultiplexer using SystemVerilog

## Overview

This project implements a **1:8 Demultiplexer (DEMUX)** using synthesizable SystemVerilog.

A demultiplexer is a combinational logic circuit that routes a single data input to one of eight output lines based on three selection bits.

The design is implemented using an `always_comb` block and a `case` statement. Functional verification is performed using a self-checking SystemVerilog testbench in QuestaSim 10.7c.

## Design Specifications

| Parameter | Description |
|---|---|
| Design | 1:8 Demultiplexer |
| HDL | SystemVerilog |
| Design Type | Combinational Logic |
| Data Inputs | 1 |
| Select Inputs | 3 |
| Outputs | 8 |
| RTL Style | `always_comb` and `case` |
| Simulator | QuestaSim 10.7c |

## Input and Output Signals

| Signal | Width | Direction | Description |
|---|---:|---|---|
| Din | 1 bit | Input | Single data input |
| Sel | 3 bits | Input | Output selection control |
| Y | 8 bits | Output | Eight output lines |

## Functional Description

The three selection bits determine which output receives the input data.

Only the selected output can receive `Din`. All non-selected outputs remain LOW.

| Sel[2:0] | Active Output |
|---|---|
| 000 | Y[0] |
| 001 | Y[1] |
| 010 | Y[2] |
| 011 | Y[3] |
| 100 | Y[4] |
| 101 | Y[5] |
| 110 | Y[6] |
| 111 | Y[7] |

When `Din = 0`, all outputs remain zero regardless of the selection input.

## RTL Implementation

The design uses:

- `logic Din` for the single data input.
- `logic [2:0] Sel` for the selection lines.
- `logic [7:0] Y` for the eight outputs.
- `always_comb` to describe combinational behavior.
- `case` to route the data input to the selected output.

The output vector is initially assigned zero. The selected output is then assigned the value of `Din`.

## Verification Methodology

A self-checking SystemVerilog testbench verifies the functionality of the demultiplexer.

### Test Cases

1. `Din = 0` with all eight selection combinations.
2. `Din = 1` with all eight selection combinations.
3. Independent expected-output calculation.
4. Complete 8-bit output comparison using case inequality (`!==`).
5. Automatic PASS and FAIL counters.

### Verification Summary

| Parameter | Result |
|---|---:|
| Total test cases | 16 |
| Passed | [Actual PASS count] |
| Failed | [Actual FAIL count] |

**Final Result:** Refer to `simulation/simulation_output.txt` for the actual QuestaSim verification result.

## Simulation Evidence

The `simulation` directory contains:

- `waveform.png` – QuestaSim waveform screenshot showing data routing behavior.
- `simulation_output.txt` – Actual simulation verification summary.

## Tools Used

- SystemVerilog
- QuestaSim 10.7c
- Notepad
- Git and GitHub

## Learning Outcomes

Through this project, the following concepts were practiced:

- Designing combinational circuits using SystemVerilog.
- Understanding demultiplexer data-routing logic.
- Using `always_comb` and `case` statements.
- Developing self-checking testbenches.
- Verifying all input and selection combinations.
- Analyzing simulation waveforms in QuestaSim.

## Repository Structure

```text
16_1to8_demux/
├── rtl/
│   └── demux_1to8.sv
├── testbench/
│   └── demux_1to8_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

---

**Author:** Preetkumar Kayasth

**Project Category:** Digital Design and RTL Verification

**Repository:** Verilog Digital Design Basics