# 16:4 Priority Encoder – SystemVerilog

## Overview

This project implements a **16:4 Priority Encoder** using synthesizable SystemVerilog.

A priority encoder is a combinational logic circuit that converts multiple input signals into a binary-coded output. When multiple inputs are HIGH simultaneously, the input with the highest index receives priority.

This implementation uses a descending priority structure, where `D[15]` has the highest priority and `D[0]` has the lowest priority.

## Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 16:4 Priority Encoder |
| HDL | SystemVerilog |
| Inputs | D[15:0] |
| Encoded Output | Y[3:0] |
| Valid Signal | Valid |
| Circuit Type | Combinational Logic |
| Simulation Tool | QuestaSim 10.7c |

## Working Principle

The encoder checks the input bits in descending priority order.

- If `D[15]` is HIGH, output is `1111`.
- Otherwise, if `D[14]` is HIGH, output is `1110`.
- This continues down to `D[0]`.
- If all inputs are LOW, output is `0000` and `Valid = 0`.

### Priority Table

| Highest active input | Y[3:0] | Valid |
|---|---|---|
| D[15] | 1111 | 1 |
| D[14] | 1110 | 1 |
| D[13] | 1101 | 1 |
| D[12] | 1100 | 1 |
| D[11] | 1011 | 1 |
| D[10] | 1010 | 1 |
| D[9] | 1001 | 1 |
| D[8] | 1000 | 1 |
| D[7] | 0111 | 1 |
| D[6] | 0110 | 1 |
| D[5] | 0101 | 1 |
| D[4] | 0100 | 1 |
| D[3] | 0011 | 1 |
| D[2] | 0010 | 1 |
| D[1] | 0001 | 1 |
| D[0] | 0000 | 1 |
| None | 0000 | 0 |

## Priority Example

Consider:

`D = 16'b1000_0000_0010_0100`

Here, D[15], D[5] and D[2] are HIGH.

Since D[15] has the highest priority:

- Encoded output: `Y = 1111`
- Valid signal: `Valid = 1`

## RTL Implementation

The design uses:
- `always_comb` for combinational logic.
- Descending `if-else if` conditions for priority selection.
- Default assignments for the output and validity signal.
- No clock or sequential elements.

## Project Structure

```text
20_16to4_priority_encoder/
├── rtl/
│   └── priority_encoder_16to4.sv
├── testbench/
│   └── priority_encoder_16to4_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Verification Methodology

A self-checking SystemVerilog testbench was developed.

The verification covers:

1. All-zero input condition.
2. All 16 individual input lines.
3. All inputs HIGH simultaneously.
4. Alternating input patterns.
5. Multiple simultaneous HIGH inputs.
6. Walking-zero patterns.

An independent reference model scans the inputs from lowest to highest index. The last detected HIGH bit determines the expected encoded output.

Both `Y` and `Valid` are compared against the expected values.

**Total test cases: 43**

## Simulation Results

| Metric | Result |
|---|---:|
| Total Tests | 43 |
| PASS | 43 |
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

- Understood priority encoder architecture.
- Implemented multi-input priority logic.
- Used descending `if-else if` conditions.
- Designed a self-checking verification environment.
- Developed an independent reference model.
- Verified simultaneous HIGH inputs and priority conflicts.
- Analyzed simulation waveforms and PASS/FAIL reports.

## Author

Preetkumar Kayasth

---

Part of the **Verilog Digital Design Basics** repository.