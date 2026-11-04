# 4-Bit Arithmetic Logic Unit (ALU)

## 1. Overview

This project implements a 4-bit Arithmetic Logic Unit (ALU) using SystemVerilog.

An ALU is a fundamental component of a processor that performs arithmetic and logical operations on binary data. The operation is selected using a 3-bit opcode.

The design supports eight operations, including addition, subtraction, AND, OR, XOR, NOT, NAND, and NOR.

## 2. Design Specifications

| Parameter | Specification |
|---|---|
| HDL | SystemVerilog |
| Simulator | QuestaSim 10.7c |
| Design Type | Combinational Logic |
| Data Width | 4 bits |
| Opcode Width | 3 bits |
| Number of Operations | 8 |
| Design Module | alu_4bit |
| Testbench Module | alu_4bit_tb |

## 3. Input and Output Signals

| Signal | Direction | Width | Description |
|---|---|---|---|
| A | Input | 4 bits | First operand |
| B | Input | 4 bits | Second operand |
| Opcode | Input | 3 bits | Operation selector |
| Result | Output | 4 bits | ALU operation result |
| Carry | Output | 1 bit | Addition carry or subtraction borrow |
| Zero | Output | 1 bit | Indicates whether Result is zero |

## 4. Opcode and Operation Table

| Opcode | Operation | Description |
|---|---|---|
| 000 | ADD | A + B |
| 001 | SUB | A - B |
| 010 | AND | Bitwise AND |
| 011 | OR | Bitwise OR |
| 100 | XOR | Bitwise XOR |
| 101 | NOT | Bitwise complement of A |
| 110 | NAND | Bitwise NAND |
| 111 | NOR | Bitwise NOR |

## 5. Functional Description

### Arithmetic Operations

**Addition:** Adds two 4-bit operands. The 5-bit temporary result preserves the carry-out.

**Subtraction:** Subtracts B from A. The Carry output indicates a borrow when A is smaller than B.

### Logical Operations

- AND: Produces 1 when both corresponding bits are 1.
- OR: Produces 1 when at least one corresponding bit is 1.
- XOR: Produces 1 when corresponding bits are different.
- NOT: Inverts every bit of operand A.
- NAND: Produces the complement of the AND operation.
- NOR: Produces the complement of the OR operation.

### Status Flags

**Carry/Borrow Flag:**
- Addition: Indicates carry-out.
- Subtraction: Indicates borrow-out.
- Logical operations: Remains 0.

**Zero Flag:**
- Set to 1 when the ALU result is 0000.
- Otherwise, remains 0.

## 6. RTL Design Approach

The design uses an `always_comb` procedural block and a `case` statement to select the required operation based on the opcode.

Default assignments are provided to prevent unintended latch inference.

A 5-bit temporary variable is used to preserve the carry information during arithmetic operations.

## 7. Verification Methodology

A separate SystemVerilog testbench verifies the ALU using a self-checking approach.

The testbench includes 11 directed test cases covering:
1. Basic addition.
2. Addition with carry.
3. Basic subtraction.
4. Subtraction with borrow.
5. AND operation.
6. OR operation.
7. XOR operation.
8. NOT operation.
9. NAND operation.
10. NOR operation.
11. Zero flag verification.

Expected outputs are calculated independently and compared with the DUT outputs.

## 8. Simulation Results

Simulator: QuestaSim-64 10.7c

Expected verification summary:

- Total test cases: 11
- Passed: 11
- Failed: 0
- Overall result: All tests passed

Refer to `simulation/simulation_output.txt` for the simulation report.

## 9. Waveform

The simulation waveform is available at:

`simulation/waveform.png`

It displays the input operands, opcode, result, carry/borrow flag, and zero flag.

## 10. Project Structure

```text
08_4bit_alu/
├── rtl/
│   └── alu_4bit.sv
├── testbench/
│   └── alu_4bit_tb.sv
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
└── README.md
```

## 11. Learning Outcomes

- Understanding ALU architecture and functionality.
- Implementing arithmetic and logical operations.
- Writing synthesizable SystemVerilog RTL.
- Using combinational procedural blocks.
- Understanding opcode-based operation selection.
- Implementing carry, borrow, and zero status flags.
- Developing self-checking testbenches.
- Simulating and verifying digital circuits using QuestaSim.

## Author

Preetkumar Kayasth

**Project Category:** Digital Design | RTL Design | SystemVerilog