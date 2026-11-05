# 16:1 Multiplexer – SystemVerilog

## Overview

This project implements a **16:1 Multiplexer (MUX)** using synthesizable SystemVerilog.

A 16:1 multiplexer is a combinational logic circuit that selects one of sixteen input signals based on a 4-bit selection signal and forwards the selected input to a single output.

## Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 16:1 Multiplexer |
| HDL | SystemVerilog |
| Data Inputs | D[15:0] |
| Select Inputs | Sel[3:0] |
| Output | Y |
| Circuit Type | Combinational Logic |
| Simulation Tool | QuestaSim 10.7c |

## Working Principle

The multiplexer uses four select lines to determine which data input is connected to the output.

The selection is performed as follows:

| Sel[3:0] | Selected Input |
|---|---|
| 0000 | D[0] |
| 0001 | D[1] |
| 0010 | D[2] |
| 0011 | D[3] |
| 0100 | D[4] |
| 0101 | D[5] |
| 0110 | D[6] |
| 0111 | D[7] |
| 1000 | D[8] |
| 1001 | D[9] |
| 1010 | D[10] |
| 1011 | D[11] |
| 1100 | D[12] |
| 1101 | D[13] |
| 1110 | D[14] |
| 1111 | D[15] |

The output follows the selected input:

`Y = D[Sel]`

## RTL Implementation

The design uses:
- `always_comb` for combinational logic.
- `case` statements for selection.
- A default assignment to ensure a defined output for unmatched or unknown select values.

## Project Structure

```text
18_16to1_mux/
├── rtl/
│   └── mux_16to1.sv
├── testbench/
│   └── mux_16to1_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Verification Methodology

A self-checking SystemVerilog testbench was developed to verify the multiplexer.

Six input patterns were used:

1. All zeros (`16'h0000`)
2. All ones (`16'hFFFF`)
3. Alternating ones and zeros (`16'hAAAA`)
4. Alternating zeros and ones (`16'h5555`)
5. Walking-one pattern
6. Walking-zero pattern

Each pattern was tested against all 16 select combinations.

- Total input patterns: 36
- Select combinations per pattern: 16
- Total verification cases: 576

The testbench compares the DUT output with an independently calculated expected value.

## Simulation Results

| Metric | Result |
|---|---:|
| Total Tests | 576 |
| PASS | 576 |
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

- Understood the operation of a 16:1 multiplexer.
- Implemented combinational selection logic using `always_comb` and `case`.
- Practiced parameter-independent RTL coding.
- Developed a self-checking testbench.
- Performed exhaustive select-line verification across multiple data patterns.
- Analyzed simulation waveforms and PASS/FAIL reports.

## Author

Preetkumar Kayasth

---

Part of the **Verilog Digital Design Basics** repository.