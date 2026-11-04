# 4:1 Multiplexer using SystemVerilog

## 1. Overview

This project implements a 4:1 Multiplexer (MUX) using SystemVerilog.

A multiplexer is a combinational digital circuit that selects one of multiple input signals and forwards the selected signal to a single output.

The 4:1 MUX has four data inputs, two select lines and one output. The selected input is determined by the binary value of the select lines.

## 2. Design Specifications

| Parameter | Specification |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Type | Combinational Logic |
| Data Inputs | 4 |
| Select Lines | 2 |
| Output | 1 |
| Design Module | mux_4to1 |
| Testbench Module | mux_4to1_tb |

## 3. Input and Output Signals

| Signal | Direction | Width | Description |
|---|---|---|---|
| I0 | Input | 1 bit | Data input 0 |
| I1 | Input | 1 bit | Data input 1 |
| I2 | Input | 1 bit | Data input 2 |
| I3 | Input | 1 bit | Data input 3 |
| Sel | Input | 2 bits | Input selection control |
| Y | Output | 1 bit | Selected output |

## 4. Truth Table

| S1 | S0 | Selected Input | Output |
|---|---|---|---|
| 0 | 0 | I0 | I0 |
| 0 | 1 | I1 | I1 |
| 1 | 0 | I2 | I2 |
| 1 | 1 | I3 | I3 |

## 5. Boolean Expression

The Boolean expression for the 4:1 multiplexer is:

Y = (~S1 & ~S0 & I0) | (~S1 & S0 & I1) | (S1 & ~S0 & I2) | (S1 & S0 & I3)

This expression shows how each select-line combination enables exactly one data input path.

## 6. RTL Design Approach

The design uses an `always_comb` procedural block with a `case` statement.

The select input determines which data input is assigned to the output:

- `00`: I0 is selected.
- `01`: I1 is selected.
- `10`: I2 is selected.
- `11`: I3 is selected.

All select combinations are covered explicitly.

## 7. Verification Methodology

A separate SystemVerilog self-checking testbench verifies the design.

The testbench exhaustively checks all possible input combinations:

- Four data inputs: 2^4 = 16 combinations.
- Two select inputs: 2^2 = 4 combinations.
- Total combinations: 16 × 4 = 64.

For each combination, the expected output is calculated and compared against the DUT output.

The testbench reports PASS or FAIL for every test case.

## 8. Simulation