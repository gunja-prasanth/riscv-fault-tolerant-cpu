# 🟦 Day-11: Recovery FSM Design (Paper → RTL)

---

## 🎯 Objective
The objective of Day-11 is to design a **clear and deterministic Recovery Finite State Machine (FSM)**
for the fault-tolerant RISC-V CPU **before** implementing it in RTL.

This document defines:
- FSM states
- State meanings
- Transition conditions
- System-level behavior during faults

---

## 🧠 Why an FSM is Required

Fault handling is **not a single-cycle action**.  
Different faults require the system to:
- Pause execution
- Recover safely
- Resume normal operation

An FSM ensures:
- Predictable behavior
- Safe sequencing
- No undefined transitions

---

## 🧩 FSM States Definition

### 🟢 1. NORMAL
- CPU operates normally
- Instructions execute without interruption
- No active fault detected

---

### 🟡 2. FREEZE
- CPU execution is **temporarily halted**
- Program Counter and registers are held
- No new instructions are fetched
- Used immediately after fault detection

---

### 🔵 3. RECOVER
- Fault recovery actions are performed
- Examples:
  - Flush pipeline
  - Reset control logic
  - Correct internal state (if possible)

---

### 🟣 4. RESUME
- CPU prepares to return to NORMAL state
- Internal signals are re-enabled
- Execution resumes from a safe point

---

## 🔄 FSM State Transition Rules

| Current State | Condition | Next State |
|--------------|-----------|------------|
| NORMAL | No fault | NORMAL |
| NORMAL | Minor fault detected | FREEZE |
| NORMAL | Critical fault detected | FREEZE |
| FREEZE | Fault is minor | RECOVER |
| FREEZE | Fault is critical | RECOVER |
| RECOVER | Recovery successful | RESUME |
| RECOVER | Recovery failed | FREEZE |
| RESUME | Resume completed | NORMAL |

---

## 🧱 FSM Flow Diagram (ASCII)

    +---------+
    | NORMAL  |
    +----+----+
         |
 Fault Detected
         |
    +---------+
    | FREEZE  |
    +----+----+
         |
    Start Recovery
         |
    +---------+
    | RECOVER |
    +----+----+
         |
 Recovery Successful
         |
    +---------+
    | RESUME  |
    +----+----+
         |
 Resume Complete
         |
    +---------+
    | NORMAL  |
    +---------+

---

## 🧠 Design Principles

✔ No direct jump from NORMAL → RECOVER  
✔ FREEZE always isolates the system first  
✔ Recovery is explicit and observable  
✔ FSM is fully deterministic  
✔ No undefined or circular transitions  

---

## 🔮 Future RTL Mapping (Preview)

In upcoming days, this FSM will be implemented using:
- Enumerated state encoding
- Sequential always block for state register
- Combinational always block for next-state logic

----
