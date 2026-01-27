# 🟦 Day-12: Recovery FSM RTL Implementation

---

## 🎯 Objective
The objective of **Day-12** is to implement the **Recovery Finite State Machine (FSM)** in **RTL**, based on the paper design defined on Day-11.

This FSM controls how the processor safely reacts to detected faults by sequencing through well-defined recovery states.

---

## 🧠 Design Goals

✔ Synchronous FSM design  
✔ Clean and deterministic reset behavior  
✔ Safe default assignments  
✔ No undefined states  
✔ Fully synthesizable Verilog (Vivado 2018 compatible)

---

## 🔄 FSM Overview

The Recovery FSM consists of **four states** that manage fault handling and system recovery.

### 🧩 FSM States

| State | Description |
|------|-------------|
| 🟢 **NORMAL** | CPU operates normally |
| 🟡 **FREEZE** | CPU execution is halted safely |
| 🔵 **RECOVER** | Recovery actions are performed |
| 🟣 **RESUME** | CPU resumes execution |

---

## 🥇 FSM Transition Flow

NORMAL
|
| Fault detected
v
FREEZE
|
| Automatic
v
RECOVER
|
| recovery_done = 1
v
RESUME
|
| Automatic
v
NORMAL


---

## 🔌 FSM Inputs

| Signal | Purpose |
|------|---------|
| `clk` | System clock |
| `reset` | Asynchronous reset |
| `minor_fault` | Indicates a recoverable fault |
| `critical_fault` | Indicates a severe fault |
| `recovery_done` | Signals completion of recovery |

---

## 📤 FSM Outputs (Moore Type)

| Output | Description |
|------|-------------|
| `freeze_cpu` | Freezes CPU execution |
| `recover_cpu` | Activates recovery logic |
| `resume_cpu` | Resumes normal operation |

---

## 🧠 RTL Design Characteristics

- **Synchronous FSM**  
  → State transitions occur only on clock edges  
- **Asynchronous reset**  
  → FSM always starts in `NORMAL` state  
- **Moore-style outputs**  
  → Outputs depend only on current state  
- **Safe defaults**  
  → No unintended latches or glitches  

---

## 🧪 Verification

Behavioral simulation was performed using Vivado to validate:

✔ Correct state transitions  
✔ Proper response to minor and critical faults  
✔ Clean reset behavior  
✔ Correct output assertion per state  

📸 Waveform proof captured for verification.

---

---

## ✅ Outcome

✔ Recovery FSM successfully implemented in RTL  
✔ Clean and deterministic control flow  
✔ Verified through simulation  
✔ Ready for system-level integration  

----