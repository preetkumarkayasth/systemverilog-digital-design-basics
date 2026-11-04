# 8:1 Multiplexer using SystemVerilog

## Overview

This project implements an **8:1 Multiplexer (MUX)** using synthesizable SystemVerilog.

An 8:1 multiplexer is a combinational logic circuit that selects one of eight input signals based on three selection bits and forwards the selected input to a single output.

The design is implemented using an `always_comb` block and a `case` statement. Functional verification is performed using a self-checking SystemVerilog testbench in QuestaSim 10.7c.

## Design Specifications

| Parameter | Description |
|---|---|
| Design | 8:1 Multiplexer |
| HDL | SystemVerilog |
| Design Type | Combinational Logic |
| Data Inputs | 8 |
| Select Inputs | 3 |
| Output | 1 |
| RTL Style | `always_comb` and `case` |
| Simulator | QuestaSim 10.7c |

## Input and Output Signals

| Signal | Width | Direction | Description |
|---|---:|---|---|
| D | 8 bits | Input | Eight data input lines |
| Sel | 3 bits | Input | Input selection control |
| Y | 1 bit | Output | Selected data output |

## Functional Description

The three selection bits determine which data input is connected to the output.

| Sel[2:0] | Selected Input | Output |
|---|---|---|
| 000 | D[0] | Y = D[0] |
| 001 | D[1] | Y = D[1] |
| 010 | D[2] | Y = D[2] |
| 011 | D[3] | Y = D[3] |
| 100 | D[4] | Y = D[4] |
| 101 | D[5] | Y = D[5] |
| 110 | D[6] | Y = D[6] |
| 111 | D[7] | Y = D[7] |

## RTL Implementation

The design uses:

- `logic [7:0] D` for the eight data inputs.
- `logic [2:0] Sel` for the selection lines.
- `logic Y` for the output.
- `always_comb` to describe combinational behavior.
- `case` to select the corresponding input bit.

A default assignment is included to ensure that the output is assigned for every selection branch.

## Verification Methodology

A self-checking SystemVerilog testbench verifies the multiplexer functionality.

### Test Patterns

1. All-zero data pattern.
2. All-one data pattern.
3. Alternating pattern: `10101010`.
4. Reverse alternating pattern: `01010101`.
5. Eight walking-one patterns.
6. Eight walking-zero patterns.
7. 100 randomized data patterns.

Each pattern is tested against all eight selection combinations.

### Verification Summary

| Parameter | Result |
|---|---:|
| Total test cases | 960 |
| Passed | 960 |
| Failed | 0 |
| Simulation time | 9600 ns |
| Compilation errors | 0 |
| Compilation warnings | 0 |

**Final Result: ALL TESTS PASSED**

## Simulation Evidence

The `simulation` directory contains:

- `waveform.png` – QuestaSim waveform screenshot.
- `simulation_output.txt` – Actual simulation verification summary.

## Tools Used

- SystemVerilog
- QuestaSim 10.7c
- Notepad
- Git and GitHub

## Learning Outcomes

This project provided practical experience with:

- Designing combinational circuits using SystemVerilog.
- Understanding multiplexer selection logic.
- Using `always_comb` and `case` statements.
- Developing self-checking testbenches.
- Applying directed and randomized verification.
- Performing waveform analysis in QuestaSim.

## Repository Structure

```text
15_8to1_mux/
├── rtl/
│   └── mux_8to1.sv
├── testbench/
│   └── mux_8to1_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

---

**Author:** Preetkumar Kayasth

**Project Category:** Digital Design and RTL Verification

**Repository:** Verilog Digital Design Basics