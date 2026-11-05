# 8-Bit Parity Generator and Checker – SystemVerilog

## Overview
This project implements an 8-bit parity generator and checker using synthesizable SystemVerilog. It supports both even and odd parity generation and checks received parity for transmission errors.

The design is verified using a self-checking testbench in QuestaSim 10.7c.

## Design Specifications

| Signal | Direction | Width | Description |
|---|---|---:|---|
| `Data` | Input | 8 bits | Input data |
| `Received_Parity` | Input | 1 bit | Received parity bit |
| `Even_Parity` | Output | 1 bit | Generated even parity bit |
| `Odd_Parity` | Output | 1 bit | Generated odd parity bit |
| `Even_Error` | Output | 1 bit | Error indication for even parity |
| `Odd_Error` | Output | 1 bit | Error indication for odd parity |

## Working Principle

### 1. Even Parity Generation
The even parity bit makes the total number of 1s in the data and parity bit even.

\[
P_{even}=D_7\oplus D_6\oplus\cdots\oplus D_0
\]

### 2. Odd Parity Generation
The odd parity bit makes the total number of 1s odd.

\[
P_{odd}=\overline{P_{even}}
\]

### 3. Parity Checking
The checker evaluates the received data and parity bit together.

- `Even_Error = 1`: Received data and parity do not satisfy even parity.
- `Odd_Error = 1`: Received data and parity do not satisfy odd parity.
- `0`: No parity error detected for the respective parity scheme.

**Note:** A parity checker detects an odd number of bit errors, but cannot reliably detect an even number of bit errors.

## Project Structure

```text
21_8bit_parity_generator_checker/
├── rtl/
│   └── parity_generator_checker_8bit.sv
├── testbench/
│   └── parity_generator_checker_8bit_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## Verification

The self-checking testbench exhaustively verifies:

- All 256 possible 8-bit data combinations.
- Both possible received parity bit values for each data combination.
- Even and odd parity generation.
- Even and odd parity error detection.

### Simulation Results

| Metric | Result |
|---|---:|
| Total test cases | 512 |
| Passed | 512 |
| Failed | 0 |
| Simulation status | PASS |

<details>
<summary>Simulation Summary</summary>

```text
Total Tests : 512
PASS        : 512
FAIL        : 0
RESULT      : ALL TESTS PASSED
```

</details>

## Simulation Waveform

![8-Bit Parity Generator and Checker Waveform](simulation/waveform.png)

## Tools Used

- **HDL:** SystemVerilog
- **Simulator:** QuestaSim 10.7c
- **Editor:** Notepad
- **Verification:** Self-checking testbench with exhaustive input testing

## Key Concepts Learned

- Reduction XOR and XNOR operators
- Even and odd parity generation
- Parity-based error detection
- Combinational logic design using `always_comb`
- SystemVerilog testbench development
- Exhaustive functional verification

## Author

**Preetkumar Kayasth**

GitHub: [preetkumarkayasth](https://github.com/preetkumarkayasth)