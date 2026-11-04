# 1:4 Demultiplexer using SystemVerilog

## Overview

This project implements a **1:4 Demultiplexer (DEMUX)** using synthesizable SystemVerilog.

A demultiplexer is a combinational logic circuit that routes a single data input to one of four outputs based on a 2-bit select signal.

The design was simulated and verified using **QuestaSim 10.7c** with a self-checking SystemVerilog testbench.

## Design Specifications

| Parameter | Description |
|---|---|
| Circuit | 1:4 Demultiplexer |
| Design type | Combinational logic |
| HDL | SystemVerilog |
| Data inputs | 1 |
| Select inputs | 2 |
| Outputs | 4 |
| Simulator | QuestaSim 10.7c |

## Input and Output Signals

**Inputs**
- `Din` – Data input
- `Sel[1:0]` – Select lines

**Outputs**
- `Y0`
- `Y1`
- `Y2`
- `Y3`

## Truth Table

| Din | Sel[1:0] | Y0 | Y1 | Y2 | Y3 |
|---:|:---:|---:|---:|---:|---:|
| 0 | 00 | 0 | 0 | 0 | 0 |
| 0 | 01 | 0 | 0 | 0 | 0 |
| 0 | 10 | 0 | 0 | 0 | 0 |
| 0 | 11 | 0 | 0 | 0 | 0 |
| 1 | 00 | 1 | 0 | 0 | 0 |
| 1 | 01 | 0 | 1 | 0 | 0 |
| 1 | 10 | 0 | 0 | 1 | 0 |
| 1 | 11 | 0 | 0 | 0 | 1 |

## Boolean Expressions

Let the select inputs be `S1` and `S0`.

- `Y0 = Din AND NOT S1 AND NOT S0`
- `Y1 = Din AND NOT S1 AND S0`
- `Y2 = Din AND S1 AND NOT S0`
- `Y3 = Din AND S1 AND S0`

## RTL Implementation

The design uses:
- `logic` data types.
- `always_comb` for combinational logic.
- `case` statements for output selection.
- Default output assignments to avoid unintended latch inference.

## Verification Methodology

A self-checking SystemVerilog testbench was developed.

Verification features:
- Exhaustive testing of all 8 possible input combinations.
- Independent reference model for expected outputs.
- Case inequality (`!==`) for comparison.
- Automatic PASS and FAIL counters.
- Overall simulation status reporting.

## Simulation Results

| Metric | Result |
|---|---:|
| Total test cases | 8 |
| Passed | 8 |
| Failed | 0 |
| Overall status | ALL TESTS PASSED |

*The results above should match the actual QuestaSim Transcript.*

## Waveform

The simulation waveform is available at:

`simulation/waveform.png`

## Project Structure

```text
10_1