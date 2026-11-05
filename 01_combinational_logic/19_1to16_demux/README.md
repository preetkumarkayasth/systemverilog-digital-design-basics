# 1:16 Demultiplexer – SystemVerilog

## Overview

This project implements a **1:16 Demultiplexer (DEMUX)** using synthesizable SystemVerilog.

A 1:16 demultiplexer is a combinational logic circuit that takes one data input and routes it to one of sixteen output lines based on a 4-bit selection signal.

When the data input is LOW, all outputs remain LOW. When the data input is HIGH, only the selected output becomes HIGH.

## Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 1:16 Demultiplexer |
| HDL | SystemVerilog |
| Data Input | Din |
| Select Inputs | Sel[3:0] |
| Outputs | Y[15:0] |
| Circuit Type | Combinational Logic |
| Simulation Tool | QuestaSim 10.7c |

## Working Principle

The four select lines determine which output receives the input data.

For example:

| Din | Sel[3:0] | Active Output |
|---:|---|---|
| 1 | 0000 | Y[0] |
| 1 | 0001 | Y[1] |
| 1 | 0010 | Y[2] |
| 1 | 0101 | Y[5] |
| 1 | 1010 | Y[10] |
| 1 | 1111 | Y[15] |
| 0 | Any | All outputs LOW |

All unselected outputs remain LOW.

## RTL Implementation

The design uses:
- `always_comb` for combinational logic.
- `case` statements to select the destination output.
- An initial zero assignment to ensure all unselected outputs remain LOW.
- A default assignment for unmatched or unknown select values.

## Project Structure

```text
19_1to16_demux/
├── rtl/
│   └── demux_1to16.sv
├── testbench/
│   └── demux_1to16_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Verification Methodology

A self-checking SystemVerilog testbench was developed to verify the demultiplexer.

Exhaustive testing was performed:

1. `Din = 0` with all 16 select combinations.
2. `Din = 1` with all 16 select combinations.
3. Actual output compared against the independently calculated expected output.
4. One-hot output condition checked using `$countones()`.

**Total test cases: 32**

## Simulation Results

| Metric | Result |
|---|---:|
| Total Tests | 32 |
| PASS | 32 |
| FAIL | 0 |
| Result | ALL TESTS PASSED |

Simulation was performed using QuestaSim 10.7c.

## Simulation Waveform

The waveform screenshot is available at:

`simulation/waveform.png`

## Tools Used

- SystemVerilog
- QuestaSim 10.7c
- Notepad
- Git and GitHub

## Learning Outcomes

- Understood the operation of a 1:16 demultiplexer.
- Implemented combinational routing logic using `always_comb` and `case`.
- Practiced exhaustive verification of all input combinations.
- Used `$countones()` for one-hot output validation.
- Developed a self-checking testbench.
- Analyzed simulation waveforms and PASS/FAIL reports.

## Author

Preetkumar Kayasth

---

Part of the **Verilog Digital Design Basics** repository.