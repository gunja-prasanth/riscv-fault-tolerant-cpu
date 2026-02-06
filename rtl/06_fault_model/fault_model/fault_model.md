# RTL Fault Model for RISC-V Control Subsystem

## 1. Purpose and Context

This document formally defines the notion of a fault at the Register Transfer Level (RTL) for a base RISC-V control subsystem.

The objective of this fault model is to establish a clear and unambiguous fault domain prior to the implementation of fault detection, flagging, or recovery mechanisms. All subsequent fault-handling logic will be strictly derived from the definitions presented in this document.

This approach ensures architectural clarity, design correctness, and scalability of the fault-tolerant extensions.

---

## 2. Fault Classification Overview

The RTL fault model is restricted to the following three fault categories:

1. Invalid Opcode Fault  
2. Illegal Control Combination Fault  
3. Stuck-At Fault  

No additional fault types are considered at this stage.

---

## 3. Fault Type 1: Invalid Opcode

### Definition

An Invalid Opcode Fault occurs when an instruction opcode does not belong to the supported RISC-V base instruction set implemented by the control subsystem.

### Rationale

The control unit is designed to generate control signals only for a predefined set of legal opcodes. Encountering an unsupported opcode makes it impossible to produce a valid and deterministic control response, leading to undefined execution behavior.

### RTL Rule

If the decoded opcode does not match any supported instruction encoding, the instruction shall be classified as invalid at the RTL level.

### Expected System Response (Future Scope)

- Assertion of an `invalid_opcode` fault indicator  
- Prevention of architectural state updates for the affected instruction  

---

## 4. Fault Type 2: Illegal Control Combination

### Definition

An Illegal Control Combination Fault occurs when two or more mutually exclusive control signals are asserted simultaneously, or when no valid control action is asserted for a valid instruction.

### Representative Examples

- Simultaneous assertion of `mem_read` and `mem_write`  
- Concurrent assertion of `alu_add` and `alu_sub`  
- Absence of any valid operation while the instruction is marked as valid  

### Rationale

Such control signal combinations do not correspond to any legal instruction behavior and may result in unsafe hardware operation, data corruption, or loss of execution determinism.

### RTL Rule

For every instruction, exactly one valid control path must be active. Any deviation from this constraint shall be treated as an illegal control condition.

### Expected System Response (Future Scope)

- Assertion of an `illegal_control` fault indicator  
- Suppression of register writes and memory updates  

---

## 5. Fault Type 3: Stuck-At Fault

### Definition

A Stuck-At Fault is defined as a condition in which a control signal remains permanently at logic 0 or logic 1, independent of the expected instruction-driven behavior.

### Typical Signal Candidates

- `pc_en`  
- `reg_write`  
- ALU control signals  

### Rationale

Persistent signal values prevent correct instruction sequencing, inhibit forward progress, and may lead to deadlock or repeated execution states.

### RTL Rule

Control signals are expected to toggle in accordance with instruction flow. A signal exhibiting no state transition across multiple cycles, when transitions are expected, shall be considered suspicious and indicative of a stuck-at condition.

### Expected System Response (Future Scope)

- Detection of abnormal non-toggling behavior over time  
- Assertion of a `stuck_at` fault indicator  

---

## 6. Scope Limitation

The scope of this document is intentionally limited to fault definition only.

The following are explicitly excluded:
- Fault correction mechanisms  
- Recovery or rollback logic  
- Redundancy or reconfiguration strategies  

These aspects will be addressed in subsequent design stages.

---

## 7. Status

The RTL fault model has been clearly defined and validated for architectural consistency. It is now ready to serve as the foundation for RTL-level fault detection and handling logic in upcoming implementation phases.

----