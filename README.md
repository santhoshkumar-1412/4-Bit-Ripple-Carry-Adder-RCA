
# 4-Bit Ripple Carry Adder (RCA) using Verilog HDL

<p align="center">
  <b>RTL Design | Digital Electronics | Functional Verification</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Architecture-Ripple%20Carry%20Adder-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Synopsys%20VCS-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Debugging-Synopsys%20Verdi-purple?style=for-the-badge" />
</p>

## 1. Project Overview

This project presents the RTL design and functional verification of a **4-Bit Ripple Carry Adder (RCA)** using Verilog Hardware Description Language (HDL).

A Ripple Carry Adder is a combinational digital circuit that performs binary addition of two 4-bit operands along with an input carry (Cin).

The design consists of four Full Adders (FA) connected in series. The carry output of each Full Adder is propagated to the carry input of the next Full Adder, allowing the circuit to perform multi-bit binary addition.

The design generates a 4-bit Sum output and a final Carry-out (Cout).

The RTL implementation is simulated using **Synopsys VCS**, while waveform visualization and debugging are performed using **Synopsys Verdi**.

## 2. Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 4-Bit Ripple Carry Adder |
| Design Type | Combinational Logic |
| Architecture | Ripple Carry Adder |
| Input A | 4-bit |
| Input B | 4-bit |
| Carry Input | 1-bit |
| Sum Output | 4-bit |
| Carry Output | 1-bit |
| Number of Full Adders | 4 |
| HDL | Verilog |
| Simulator | Synopsys VCS |
| Waveform Viewer | Synopsys Verdi |
| Waveform Format | VCD / FSDB |

## 3. Design Architecture

The Ripple Carry Adder performs binary addition using four Full Adders connected in a cascaded structure.

### 3.1 Full Adder Logic

A Full Adder is a combinational circuit that adds three single-bit inputs:

- A – First input bit.
- B – Second input bit.
- Cin – Input carry.

It produces two outputs:

- Sum (S)
- Carry-out (Cout)

**Boolean Expressions:**

**Sum:**

S = A XOR B XOR Cin

**Carry:**

Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)

### 3.2 Ripple Carry Operation

The 4-bit Ripple Carry Adder consists of four Full Adder instances.

The carry output of each stage is connected to the carry input of the next stage.

The carry propagation sequence is:

**Cin -> C1 -> C2 -> C3 -> Cout**

The individual Full Adder connections are:

| Full Adder | Inputs | Carry Output |
|---|---|---|
| FA0 | A[0], B[0], Cin | C1 |
| FA1 | A[1], B[1], C1 | C2 |
| FA2 | A[2], B[2], C2 | C3 |
| FA3 | A[3], B[3], C3 | Cout |

### 3.3 Output Generation

The four Full Adders generate a 4-bit Sum and one final Carry-out.

The complete addition is represented as:

**Result = A + B + Cin**

The maximum possible result is:

**15 + 15 + 1 = 31**

Therefore, the circuit produces a 5-bit result consisting of a 4-bit Sum and a 1-bit Carry-out.

## 4. RTL Module Description

The project consists of the following Verilog modules:

| Module | Functionality |
|---|---|
| `fa` | Implements Full Adder logic |
| `bit4_rca` | Implements the 4-bit Ripple Carry Adder using four Full Adders |
| `bitrca4_tb` | Testbench for functional verification |

### 4.1 Full Adder Module

The `fa` module implements the basic Full Adder functionality.

**Inputs:**
- A
- B
- Cin

**Outputs:**
- S
- Cout

The Sum and Carry outputs are generated using XOR, AND, and OR operations.

### 4.2 4-Bit Ripple Carry Adder Module

The `bit4_rca` module instantiates four Full Adders.

The carry output of each stage is connected to the carry input of the next stage.

This structural approach demonstrates hierarchical RTL design and module instantiation in Verilog.

## 5. Repository Structure

```text
4-bit-ripple-carry-adder/
│
├── bit4_rca.v
│   └── Full Adder and 4-bit RCA RTL source
│
├── bitrca4_tb.v
│   └── Functional verification testbench
│
├── screenshots/
│   └── verdi_waveform.png
│
├── README.md
│
└── .gitignore
```

## 6. Functional Verification

A Verilog testbench is developed to verify the functionality of the 4-bit Ripple Carry Adder.

The testbench applies five different combinations of input operands and carry inputs at 10 ns intervals.

The corresponding Sum and Carry-out values are observed through simulation.

### 6.1 Test Scenarios

| Test Case | A | B | Cin | Expected Sum | Expected Cout |
|---|---|---|---|---|---|
| TC1 | 0100 (4) | 0011 (3) | 0 | 0111 (7) | 0 |
| TC2 | 0101 (5) | 1111 (15) | 1 | 0101 (5) | 1 |
| TC3 | 0011 (3) | 0010 (2) | 0 | 0101 (5) | 0 |
| TC4 | 1111 (15) | 0001 (1) | 0 | 0000 (0) | 1 |
| TC5 | 1010 (10) | 0101 (5) | 1 | 0000 (0) | 1 |

### 6.2 Expected Simulation Results

```text
Time=0  A=0100 B=0011 Cin=0 Sum=0111 Cout=0
Time=10 A=0101 B=1111 Cin=1 Sum=0101 Cout=1
Time=20 A=0011 B=0010 Cin=0 Sum=0101 Cout=0
Time=30 A=1111 B=0001 Cin=0 Sum=0000 Cout=1
Time=40 A=1010 B=0101 Cin=1 Sum=0000 Cout=1
```

All five test cases are mathematically consistent with the expected Ripple Carry Adder operation.

## 7. Simulation Setup and Execution

The RTL design is simulated using Synopsys VCS, and waveform analysis is performed using Synopsys Verdi.

### 7.1 Simulation Workflow

```text
       Verilog RTL Design
               |
               v
        Verilog Testbench
               |
               v
         Synopsys VCS
               |
               v
         RTL Simulation
               |
               v
         VCD / FSDB File
               |
               v
        Synopsys Verdi
               |
               v
        Waveform Analysis
```

### 7.2 VCS Compilation

Compile the RTL source and testbench using:

```bash
vcs -full64 -debug_access+all \
bit4_rca.v \
bitrca4_tb.v \
-o simv
```

### 7.3 Simulation Execution

Run the compiled simulation executable:

```bash
./simv
```

The simulation executes the testbench and produces the corresponding output values.

### 7.4 VCD Waveform Generation

The testbench uses the following system tasks:

```verilog
$dumpfile("4bitrca.vcd");
$dumpvars(0,bitrca4_tb);
```

These commands generate a VCD waveform file containing the simulation signals.

**Note:** In the current testbench, the dump commands are placed after the final delay. Move them to the beginning of the initial block to capture all five test cases.

### 7.5 Verdi Waveform Analysis

Open the generated FSDB waveform using:

```bash
verdi -ssf inter.fsdb &
```

For VCD-based waveform viewing, use the VCD loading option supported by your Verdi installation.

FSDB generation requires the appropriate Verdi PLI integration during VCS compilation.

## 8. Simulation Results

Synopsys Verdi is used to visualize and analyze the simulation waveforms.

The following signals are observed:

| Signal | Width | Description |
|---|---|---|
| `a[3:0]` | 4 bits | First input operand |
| `b[3:0]` | 4 bits | Second input operand |
| `cin` | 1 bit | Input carry |
| `s[3:0]` | 4 bits | Sum output |
| `cout` | 1 bit | Final carry output |

Waveform analysis helps to:

- Observe input signal transitions.
- Verify the Sum and Carry outputs.
- Understand carry propagation across Full Adder stages.
- Analyze combinational circuit behavior.
- Debug RTL functionality using signal-level waveforms.

### 8.1 Verdi Waveform Screenshot

![4-Bit Ripple Carry Adder Verdi Waveform](screenshots/verdi_waveform.png)

## 9. Key Learning Outcomes

Through this project, the following concepts are explored:

- Combinational digital circuit design.
- Full Adder logic implementation.
- Ripple Carry Adder architecture.
- Carry propagation mechanism.
- Structural RTL modeling using Verilog.
- Hierarchical module instantiation.
- Testbench development and functional verification.
- RTL simulation using Synopsys VCS.
- Waveform analysis using Synopsys Verdi.
- Simulation debugging and signal observation.

## 10. Future Enhancements

Potential extensions to this project include:

- Designing 8-bit and 16-bit Ripple Carry Adders.
- Implementing Carry Look-Ahead Adders.
- Comparing Ripple Carry and Carry Look-Ahead architectures.
- Performing RTL synthesis and area analysis.
- Evaluating propagation delay and critical path.
- Performing gate-level simulation and timing verification.

## 11. Author

**SANTHOSH KUMAR N A**

RTL Design | Digital Electronics | VLSI Engineering

- GitHub: Your GitHub Profile
- LinkedIn: Your LinkedIn Profile

## 12. License

This project is intended for educational and learning purposes.

You are welcome to explore, modify and extend the implementation with appropriate attribution.

---

<p align="center">
  <b>Designed with Verilog HDL | Simulated with Synopsys VCS | Debugged with Synopsys Verdi</b>
</p>

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>

---

## GitHub Topics

`verilog` `ripple-carry-adder` `4-bit-adder` `full-adder` `digital-design` `vlsi` `rtl-design` `synopsys-vcs` `synopsys-verdi` `rtl-verification` `combinational-logic` `asic-design`
