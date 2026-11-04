# 8-bit Magnitude Comparator using SystemVerilog

## Overview

This project implements an **8-bit unsigned magnitude comparator** using SystemVerilog. The circuit compares two 8-bit binary numbers and determines whether the first number is greater than, less than, or equal to the second number.

The design is written using synthesizable RTL and verified through a self-checking SystemVerilog testbench in QuestaSim 10.7c.

## Design Specifications

| Parameter | Description |
|---|---|
| Design | 8-bit Magnitude Comparator |
| HDL | SystemVerilog |
| Design Type | Combinational Logic |
| Input A | 8-bit unsigned number |
| Input B | 8-bit unsigned number |
| Output 1 | A_GT_B |
| Output 2 | A_LT_B |
| Output 3 | A_EQ_B |
| Simulator | QuestaSim 10.7c |

Each input represents an unsigned decimal value from 0 to 255.

## Functional Description

The comparator evaluates the relationship between inputs A and B.

- `A_GT_B = 1` when A is greater than B.
- `A_LT_B = 1` when A is less than B.
- `A_EQ_B = 1` when A is equal to B.

Only one output is HIGH for any valid binary input pair.

## Truth Table

| Condition | A_GT_B | A_LT_B | A_EQ_B |
|---|---:|---:|---:|
| A > B | 1 | 0 | 0 |
| A < B | 0 | 1 | 0 |
| A = B | 0 | 0 | 1 |

## RTL Implementation

The comparator is implemented using an `always_comb` procedural block and conditional statements.

The design uses relational operators (`>`, `<`) to compare the two unsigned 8-bit inputs. The equality condition is handled by the final `else` branch.

## Verification Methodology

A self-checking SystemVerilog testbench is used to verify the functionality of the design.

### Test Cases

- 10 directed test cases covering equality, boundary values, adjacent values, and representative hexadecimal patterns.
- 1,000 randomized input combinations generated using `$urandom_range`.
- Independent expected-output calculation for every test.
- Automatic comparison between actual DUT outputs and expected outputs.
- PASS and FAIL counters to summarize verification.

**Total planned test cases: 1,010.**

Refer to `simulation/simulation_output.txt` for the actual simulation results.

## Simulation Evidence

The `simulation` directory contains:

- `waveform.png` – QuestaSim waveform screenshot showing input and output signal behavior.
- `simulation_output.txt` – Actual simulation summary.

## Tools Used

- SystemVerilog
- QuestaSim 10.7c
- Notepad
- Git and GitHub

## Learning Outcomes

Through this project, the following concepts were practiced:

- Designing combinational circuits using SystemVerilog.
- Implementing unsigned magnitude comparison.
- Using `always_comb` and conditional statements.
- Developing self-checking testbenches.
- Applying directed and randomized verification.
- Analyzing simulation waveforms in QuestaSim.

## Repository Structure

```text
14_8bit_comparator/
├── rtl/
│   └── comparator_8bit.sv
├── testbench/
│   └── comparator_8bit_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

---

**Author:** Preetkumar Kayasth  
**Project Category:** Digital Design and RTL Verification  
**Repository:** Verilog Digital Design Basics