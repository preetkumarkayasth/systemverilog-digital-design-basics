# 4:16 Decoder – SystemVerilog

## Overview
This project implements a **4:16 Decoder** using synthesizable SystemVerilog.

A 4:16 decoder is a combinational logic circuit that converts a 4-bit binary input into a 16-bit one-hot output. Exactly one output bit is HIGH for each valid input combination.

## Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 4:16 Decoder |
| HDL | SystemVerilog |
| Inputs | A[3:0] |
| Outputs | Y[15:0] |
| Circuit Type | Combinational Logic |
| Simulation Tool | QuestaSim 10.7c |

## Working Principle

The decoder activates the output corresponding to the decimal value of the 4-bit input.

For example:
- A = `0000` → Y[0] = 1
- A = `0001` → Y[1] = 1
- A = `0101` → Y[5] = 1
- A = `1111` → Y[15] = 1

All other output bits remain LOW.

## Truth Table

| A[3:0] | Active Output |
|---|---|
| 0000 | Y[0] |
| 0001 | Y[1] |
| 0010 | Y[2] |
| 0011 | Y[3] |
| 0100 | Y[4] |
| 0101 | Y[5] |
| 0110 | Y[6] |
| 0111 | Y[7] |
| 1000 | Y[8] |
| 1001 | Y[9] |
| 1010 | Y[10] |
| 1011 | Y[11] |
| 1100 | Y[12] |
| 1101 | Y[13] |
| 1110 | Y[14] |
| 1111 | Y[15] |

## Project Structure

```text
17_4to16_decoder/
├── rtl/
│   └── decoder_4to16.sv
├── testbench/
│   └── decoder_4to16_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Verification

A self-checking SystemVerilog testbench was developed to verify the decoder.

Verification includes:
1. Exhaustive testing of all 16 input combinations.
2. Comparison of actual output against the expected one-hot output.
3. One-hot validation using the `$countones()` system function.
4. Automatic PASS/FAIL reporting.

## Simulation Results

- Total input combinations tested: 16
- PASS: 16
- FAIL: 0
- Result: ALL TESTS PASSED

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
- Understood the operation of a 4:16 decoder.
- Implemented combinational logic using `always_comb` and `case`.
- Practiced exhaustive testbench verification.
- Used `$countones()` to validate one-hot output behavior.
- Gained experience with RTL simulation and waveform analysis.

## Author
Preetkumar Kayasth

---

Part of the **Verilog Digital Design Basics** repository.