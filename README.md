# 🛡️ Configurable Fault-Tolerant RISC-V Control Subsystem  
## 🔐 RTL-Level Error Detection & Recovery

---

## 📌 1. Project Overview

Modern processors operate under aggressive performance, power, and scaling constraints, which increase susceptibility to transient and permanent faults at the hardware level. While full fault-tolerant processors are expensive and complex, **control-path reliability** offers a high-impact, low-overhead solution for improving system robustness.

This project presents a **Configurable Fault-Tolerant RISC-V Control Subsystem** implemented at the **RTL level**, focusing on **error detection, classification, and recovery** within the processor control path. Instead of implementing a full RISC-V core, the design strategically targets the **control logic**, which is highly sensitive to faults and critical to correct execution.

The system is designed, simulated, and verified entirely using **RTL design techniques**, making it suitable for academic research, internships, and VLSI interviews.

---

## 🎯 2. Motivation

### ❓ Why Fault Tolerance?

As semiconductor technologies scale down:
- Soft errors increase due to reduced noise margins
- Control logic becomes vulnerable to bit flips and illegal states
- Silent data corruption becomes harder to detect

A single incorrect control signal (e.g., unintended memory write) can cause catastrophic system failure.

### ❓ Why Control Subsystem?

- Control logic governs **all datapath actions**
- Small fault → large architectural consequence
- Easier to protect compared to full datapath duplication
- Highly suitable for RTL-based fault modeling

This project demonstrates **engineering judgment** by applying fault tolerance where it matters most.

---

## 🧠 3. Design Philosophy

The design follows these core principles:

1. **RTL-first approach**  
   All fault modeling, detection, and recovery are implemented at the RTL level without relying on hardware-specific features.

2. **Minimalism with impact**  
   No full processor duplication. No heavyweight redundancy. Only essential logic.

3. **Configurability**  
   Fault tolerance can be enabled or disabled via parameters, allowing performance vs reliability trade-offs.

4. **Deterministic recovery**  
   No undefined behavior. Every detected fault leads to a defined and safe recovery action.

5. **Verification-driven development**  
   Every feature is validated using waveform-level simulation.

---

## 🧩 4. System Architecture

### 🧱 High-Level Block Diagram

Instruction Memory
        |
        v
Instruction Decoder
        |
        v
Control Unit
        |
        v
Fault Detection Logic
        |
        v
Recovery FSM
        |
        v
Safe Control Output

---


### 📐 Architectural Scope

This project implements:
- Instruction fetch (simplified)
- Instruction decoding
- Control signal generation
- Fault detection and classification
- Recovery FSM
- Safe control signal masking

This project does **NOT** implement:
- Full datapath
- Register file
- ALU execution
- Cache or pipeline stages

This scoped design keeps the focus on **control-path reliability**.

---

## 🧪 5. Module-Level Description

### 5.1 Instruction Memory

- ROM-based instruction storage
- Indexed by Program Counter (PC)
- Provides a deterministic instruction stream for testing

Purpose:
- Acts as a stable instruction source
- Simplifies fault analysis by removing memory unpredictability

---

### 5.2 Instruction Decoder

- Extracts opcode and instruction type
- Generates decoded signals for control logic

Outputs include:
- Instruction category flags (e.g., arithmetic, memory, branch)
- Invalid opcode detection

Design choice:
- Decoder remains fault-unaware to preserve modularity

---

### 5.3 Control Unit

- Generates control signals based on decoded instruction
- Signals include:
  - Register write enable
  - Memory read/write
  - ALU operation selection

This block represents the **primary fault target**, as incorrect control signals can corrupt architectural state.

---

### 5.4 Fault Detection Logic

The fault detection unit monitors control signals and decoder outputs to identify violations of predefined correctness rules.

Detected fault categories include:
- Illegal control signal combinations
- Stuck-at behavior (modeled)
- Invalid or unsupported opcodes

The logic is purely combinational to ensure fast detection.

---

### 5.5 Fault Classification

Detected faults are classified into:
- **Minor faults** – recoverable without halting execution
- **Critical faults** – require immediate intervention

This classification enables adaptive recovery strategies.

---

### 5.6 Recovery FSM

A centralized FSM manages system behavior after fault detection.

FSM states include:
- NORMAL
- FREEZE
- RECOVERY
- RESUME

The FSM ensures:
- Control signals are safely masked
- No state corruption occurs
- Execution resumes deterministically

---

### 5.7 Safe Control Output

This block acts as the final safety gate.

- Normal control signals are passed when no fault exists
- Safe values override normal signals during fault conditions

This guarantees **fail-safe behavior** even if upstream logic misbehaves.

---

## 🚨 6. Fault Model

### 6.1 Defined Fault Types

The project explicitly defines faults at the RTL level:

1. Illegal control combinations  
2. Stuck-at control signals  
3. Invalid instruction opcodes  

Each fault type is precisely documented to avoid ambiguity.

### 6.2 Non-Goals

The following are intentionally excluded:
- Analog faults
- Timing violations
- Power-related faults
- Fabrication defects

This ensures the project remains focused and implementable.

---

## 🔁 7. Recovery Strategy

Recovery actions depend on fault classification:

- Minor faults:
  - Insert safe NOP
  - Retry instruction
- Critical faults:
  - Freeze PC
  - Mask all writes
  - Resume only after safe state restoration

The recovery logic prioritizes **data integrity over performance**.

---

## ⚙️ 8. Configurability

The subsystem supports compile-time configuration:

- Fault detection enable/disable
- Recovery depth control
- Assertion enablement

This allows:
- Performance comparison
- Educational experimentation
- Feature scalability

---

## 🧪 9. Verification Methodology

Verification is performed using:
- Directed testbenches
- Fault injection techniques
- Waveform inspection
- Assertion-based checks

Key verification goals:
- Faults are always detected
- No false positives during normal operation
- Recovery actions prevent state corruption

---

## 📊 10. Results and Observations

Simulation results demonstrate:
- Reliable detection of illegal control behavior
- Deterministic recovery without crashes
- Minimal overhead in fault-free execution

The design proves that **control-path fault tolerance is feasible and effective** at the RTL level.

---

## 🚧 11. Limitations and Future Work

### Current Limitations
- Single-cycle control model
- Simplified instruction set
- No datapath integration

### Future Enhancements
- Pipeline-aware recovery
- Datapath fault monitoring
- Formal verification
- Integration with a full RISC-V core

---

## 🎓 12. Learning Outcomes

This project strengthened skills in:
- RTL design discipline
- FSM-based recovery logic
- Fault modeling
- Verification thinking
- Architectural trade-offs

---

## ▶️ 13. How to Run

1. Open Vivado
2. Create a simulation project
3. Add RTL files from `/rtl`
4. Add testbench from `/tb`
5. Run behavioral simulation
6. Observe waveforms for fault detection and recovery

---

## 🏁 14. Conclusion

This project demonstrates that **robust fault tolerance does not require complex duplication or heavy hardware overhead**. By focusing on the control subsystem and applying RTL-level intelligence, significant reliability improvements can be achieved with minimal complexity.

The design reflects real-world VLSI engineering practices and is suitable for academic evaluation, internships, and interviews.

---

## 👤 15. Author

**Gunja Prasanth**  
B.Tech – Electronics / VLSI  
RTL Design & Verification  
