# Verilog & SystemVerilog Digital Design Projects

<p align="center">
  <strong>25 Digital Design Projects | RTL Development | Functional Verification</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/HDL-SystemVerilog-blue" alt="SystemVerilog">
  <img src="https://img.shields.io/badge/Simulator-QuestaSim-orange" alt="QuestaSim">
  <img src="https://img.shields.io/badge/Projects-25-success" alt="25 Projects">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen" alt="Completed">
</p>

## About This Repository

Welcome to my **Digital Design Projects Repository**, a collection of 25 digital logic circuits implemented using Verilog/SystemVerilog.

This repository documents my hands-on learning journey in digital logic design, RTL development, functional verification and simulation.

The objective is to strengthen my understanding of digital electronics and develop practical skills relevant to **VLSI RTL Design and Design Verification**.

Each project includes:

- Synthesizable RTL implementation.
- Independent self-checking SystemVerilog testbench.
- QuestaSim simulation waveform.
- Simulation output and verification report.
- Project-specific documentation.

## Project Overview

| Category | Number of Projects |
|---|---:|
| Combinational Logic | 21 |
| Sequential Logic | 4 |
| **Total** | **25** |

## 1. Combinational Logic Projects

These projects cover fundamental combinational circuits, arithmetic circuits, data routing, encoding, decoding and comparison.

| No. | Project | Concepts Covered |
|---:|---|---|
| 01 | [Seven Basic Logic Gates](01_combinational_logic/01_logic_gates/) | AND, OR, NOT, NAND, NOR, XOR, XNOR |
| 02 | [Half Adder](01_combinational_logic/02_half_adder/) | Binary Addition |
| 03 | [Full Adder](01_combinational_logic/03_full_adder/) | Multi-input Binary Addition |
| 04 | [Half Subtractor](01_combinational_logic/04_half_subtractor/) | Binary Subtraction |
| 05 | [Full Subtractor](01_combinational_logic/05_full_subtractor/) | Borrow Handling |
| 06 | [4-bit Ripple Carry Adder](01_combinational_logic/06_4bit_adder/) | Multi-bit Addition |
| 07 | [4-bit Ripple Borrow Subtractor](01_combinational_logic/07_4bit_subtractor/) | Multi-bit Subtraction |
| 08 | [4-bit ALU](01_combinational_logic/08_4bit_alu/) | Arithmetic and Logic Operations |
| 09 | [4:1 Multiplexer](01_combinational_logic/09_4to1_mux/) | Data Selection |
| 10 | [1:4 Demultiplexer](01_combinational_logic/10_1to4_demux/) | Data Distribution |
| 11 | [2:4 Decoder](01_combinational_logic/11_2to4_decoder/) | Binary Decoding |
| 12 | [4:2 Encoder](01_combinational_logic/12_4to2_encoder/) | Binary Encoding |
| 13 | [4-bit Magnitude Comparator](01_combinational_logic/13_4bit_comparator/) | Magnitude Comparison |
| 14 | [8-bit Magnitude Comparator](01_combinational_logic/14_8bit_comparator/) | Wider Magnitude Comparison |
| 15 | [8:1 Multiplexer](01_combinational_logic/15_8to1_mux/) | Multi-channel Selection |
| 16 | [1:8 Demultiplexer](01_combinational_logic/16_1to8_demux/) | Multi-channel Distribution |
| 17 | [4:16 Decoder](01_combinational_logic/17_4to16_decoder/) | Address Decoding |
| 18 | [16:1 Multiplexer](01_combinational_logic/18_16to1_mux/) | 16-channel Selection |
| 19 | [1:16 Demultiplexer](01_combinational_logic/19_1to16_demux/) | 16-channel Distribution |
| 20 | [16:4 Priority Encoder](01_combinational_logic/20_16to4_priority_encoder/) | Priority-based Encoding |
| 21 | [8-bit Parity Generator and Checker](01_combinational_logic/21_8bit_parity_generator_checker/) | Parity and Error Detection |

## 2. Sequential Logic Projects

These projects introduce memory elements, state retention and clock-controlled sequential circuits.

| No. | Project | Concepts Covered |
|---:|---|---|
| 22 | [SR Latch using NOR Gates](02_sequential_logic/01_sr_latch/) | Basic Memory Element |
| 23 | [Gated SR Latch](02_sequential_logic/02_gated_sr_latch/) | Enable-controlled Storage |
| 24 | [D Latch](02_sequential_logic/03_d_latch/) | Level-sensitive Storage |
| 25 | [D Flip-Flop](02_sequential_logic/04_d_flip_flop/) | Positive-edge Triggering and Asynchronous Reset |

## 3. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog / SystemVerilog | RTL Design |
| QuestaSim 10.7c | Compilation and Functional Simulation |
| SystemVerilog Testbench | Functional Verification |
| Waveform Analysis | Signal and Timing Behaviour |
| Git | Version Control |
| GitHub | Project Hosting and Documentation |

## 4. Project Directory Structure

The repository follows a modular structure to keep RTL, testbench and simulation deliverables separate.

```text
verilog-digital-design-basics/
│
├── 01_combinational_logic/
│   ├── 01_logic_gates/
│   ├── 02_half_adder/
│   ├── 03_full_adder/
│   ├── ...
│   └── 21_8bit_parity_generator_checker/
│
├── 02_sequential_logic/
│   ├── 01_sr_latch/
│   ├── 02_gated_sr_latch/
│   ├── 03_d_latch/
│   └── 04_d_flip_flop/
│
├── docs/
│   └── truth_tables/
│
├── .gitignore
├── LICENSE
└── README.md
```

Each individual project follows this structure:

```text
project_name/
│
├── rtl/
│   └── design.sv
│
├── testbench/
│   └── design_tb.sv
│
├── simulation/
│   ├── waveform.png
│   └── simulation_output.txt
│
└── README.md
```

## 5. Verification Methodology

Functional verification is performed using independent self-checking SystemVerilog testbenches.

The verification workflow includes:

1. Understanding the circuit functionality and truth table.
2. Developing the RTL implementation.
3. Creating a separate testbench.
4. Applying directed and exhaustive test vectors wherever applicable.
5. Comparing actual outputs against expected outputs.
6. Reporting PASS and FAIL results.
7. Analysing simulation waveforms.
8. Documenting the simulation results.

Case equality and inequality operators are used in testbenches where appropriate to detect unknown (`X`) and high-impedance (`Z`) values.

**Note:** Test coverage varies according to the functionality and complexity of each design. Individual project READMEs contain the relevant verification details.

## 6. How to Run a Project in QuestaSim

Follow these steps to compile and simulate an individual project.

**Step 1: Open QuestaSim**

Navigate to the selected project directory in the QuestaSim Transcript.

Example:

```tcl
cd "C:/path/to/verilog-digital-design-basics/01_combinational_logic/02_half_adder"
```

**Step 2: Create the working library**

```tcl
vlib work
```

**Step 3: Compile the RTL**

```tcl
vlog -sv rtl/half_adder.sv
```

**Step 4: Compile the testbench**

```tcl
vlog -sv testbench/half_adder_tb.sv
```

**Step 5: Load the testbench**

```tcl
vsim work.half_adder_tb
```

**Step 6: Add signals to the waveform**

```tcl
add wave -r /*
```

**Step 7: Run the simulation**

```tcl
run -all
```

The Transcript displays the test results, while the Wave window allows inspection of signal transitions and circuit behaviour.

*Note: Replace filenames and testbench module names with those belonging to the selected project.*

## 7. Learning Outcomes

Through these projects, I have worked on:

- Understanding combinational and sequential digital circuits.
- Translating circuit functionality into synthesizable RTL.
- Using SystemVerilog constructs for digital design.
- Implementing arithmetic and data-processing circuits.
- Understanding latches and edge-triggered flip-flops.
- Developing independent self-checking testbenches.
- Performing functional simulation using QuestaSim.
- Debugging compilation and simulation issues.
- Analysing waveforms and documenting verification results.
- Managing project versions using Git and GitHub.

## 8. Future Development

This repository establishes my foundation in digital logic design.

My next learning objectives include:

- Counters and shift registers.
- Finite State Machines (FSMs).
- Sequence detectors.
- UART Transmitter and Receiver.
- SPI and I2C Controllers.
- Synchronous and Asynchronous FIFOs.
- Register Files and Memory Controllers.
- Advanced SystemVerilog Verification.
- SystemVerilog Assertions (SVA).

These projects will progressively explore more complex RTL architectures and verification methodologies.

## 9. Author

**Preetkumar Kayasth**

Electronics and Communication Engineering Student

**Areas of Interest:**
- VLSI Design
- RTL Design
- Digital Design
- Functional Verification
- SystemVerilog

GitHub: [@preetkumarkayasth](https://github.com/preetkumarkayasth)

LinkedIn: [Preetkumar Kayasth](https://www.linkedin.com/)

---

⭐ If you find this repository useful for learning digital design, feel free to explore the individual projects.

**Built with SystemVerilog, simulated with QuestaSim, and documented through GitHub.**
