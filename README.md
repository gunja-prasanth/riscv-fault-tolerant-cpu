# 🛡️ Fault-Tolerant RISC-V Control Subsystem  
### RTL-Level Error Detection, Recovery & Safety Control

---

## 📌 Project Overview

Modern processors must not only be *functionally correct* but also *resilient to faults*.  
This project implements a **fault-tolerant control subsystem** for a RISC-V–based CPU, focusing on:

- **RTL-level fault detection**
- **Safe control freeze**
- **FSM-based recovery**
- **Configurable fault tolerance**
- **Formal safety guarantees**

The design is **modular, synthesizable, and simulation-proven**, making it suitable for:
- 🎓 Academic research (IITH / IISc style)
- 🧠 VLSI interviews
- 🧪 Reliability-focused RTL design roles

---

## 🎯 Design Goals

✔ Detect control-level faults  
✔ Prevent architectural state corruption  
✔ Recover execution safely  
✔ Resume normal operation deterministically  
✔ Quantify and prove correctness  

---

## 🧩 High-Level Architecture

```
          +----------------------+
          |  Fault Detector      |
          |  (Rule-based RTL)    |
          +----------+-----------+
                     |
                     v
          +----------------------+
          |  Fault Classifier    |
          |  Minor / Critical   |
          +----------+-----------+
                     |
                     v
          +----------------------+
          |  Recovery FSM        |
          |  NORMAL → FREEZE →  |
          |  RECOVER → RESUME   |
          +----------+-----------+
                     |
                     v
          +----------------------+
          |  Recovery Actions    |
          |  PC rollback        |
          |  NOP insertion      |
          |  Retry enable       |
          +----------+-----------+
                     |
                     v
          +----------------------+
          |  Safe Control MUX    |
          |  Safety > Normal    |
          +----------------------+
```

---

## 🧠 Fault Model (RTL-Level)

The system detects **control-path faults**, including:

- ❌ Illegal opcode patterns  
- ❌ Invalid control signal combinations  
- ❌ Stuck-at control signals  

Faults are **classified**, not blindly handled:

| Fault Type | Description              | Action Taken |
|-----------|--------------------------|--------------|
| Minor     | Recoverable inconsistency| Controlled recovery |
| Critical  | Unsafe state risk        | Immediate freeze |

---

## 🔁 Recovery FSM

The heart of the design is a **synchronous Moore FSM**:

| State   | Purpose |
|--------|---------|
| NORMAL | Fault-free execution |
| FREEZE | Stop PC & writes |
| RECOVER | Roll back & correct |
| RESUME | Controlled restart |

✔ Clean reset  
✔ Safe defaults  
✔ No combinational loops  

---

## 🧯 Safety Mechanisms

### 1️⃣ Control Freeze Logic
- PC write disabled
- Register & memory writes masked
- Guarantees **no state corruption**

### 2️⃣ Recovery Action Logic
- PC rollback to the last known safe value
- NOP insertion to flush bad instructions
- Retry enable for safe re-execution

### 3️⃣ Safe Control MUX
- Final arbitration point
- **Safety always has a priority**
- Prevents unsafe control leakage

---

## ⚙️ Configurability (Day-20 Feature)

Fault tolerance can be enabled or disabled via parameter:

```verilog
parameter ENABLE_FAULT_TOLERANCE = 1'b1
```

| Mode | Behavior |
|----|---------|
| `1` | Full fault detection + recovery |
| `0` | Pure normal control path |

This allows:
- Performance comparison
- Area vs safety tradeoff analysis
- Research-level experimentation

---

## 🧪 Verification Strategy

✔ Unit-level testbenches for each block  
✔ Fault injection tests  
✔ Corner case testing:
- Back-to-back faults
- Reset during fault
- Fault during recovery  

✔ System-level integration testbench  

---

## ✅ Formal Safety Assertions (SystemVerilog)

Key guarantees are **formally asserted**:

- ❗ No writes during fault
- 🔁 Recovery eventually resumes
- 🧱 No deadlock states

Assertions are simulation-checked and aligned with FSM behavior.

---

## 📊 Results Summary

- ✔ Faults detected within bounded cycles
- ✔ No illegal writes during faults
- ✔ Deterministic recovery
- ✔ Minimal performance overhead
- ✔ Clean synthesis & elaboration

---

## 📂 Repository Structure

```
rtl/
 ├─ fault/                # Fault detection & classification
 ├─ fsm/                  # Recovery FSM
 ├─ control_freeze/       # Freeze logic
 ├─ recovery_action/      # PC rollback & retry
 ├─ safe_control_mux/     # Safety-priority mux
 ├─ fault_tolerant_control/ # Integrated top
 └─ top/                  # Base control subsystem

tb/
 ├─ unit testbenches
 ├─ fault injection tests
 ├─ corner case tests
 └─ system-level TB
```

---

## ▶️ How to Run (Vivado)

1. Open **Vivado 2018.2**
2. Load project
3. Set testbench as simulation top
4. Run **Behavioral Simulation**
5. Observe waveform proofs

No external IPs required.

---

> “This project implements an RTL-level fault-tolerant control subsystem for a RISC-V CPU.  
> Instead of reacting blindly, it classifies the faults, freezes unsafe execution, performs controlled recovery, and safely resumes operation.  
> The design is configurable, formally asserted, and fully verified through simulation and corner-case testing.”

---

## 🏁 Status

✔ Design complete  
✔ Verified  
✔ Documented  
✔ Research-ready  


---


# 🔬 Phase-2 Extension: Activity-Aware Power & Performance Estimation

---

## 📌 Overview
This project is the extended with a **passive, activity-aware estimation layer**
that enables **early-stage power and performance analysis** at the RTL
**control-logic level**.

✔ The estimation logic **observes** control behavior  
✔ It does **NOT** affect functional execution  
✔ It does **NOT** alter timing or fault-tolerance guarantees  

---

## 🎯 Motivation
Early power and performance evaluation is essential for architectural
trade-off analysis, particularly in **fault-tolerant systems** where
recovery mechanisms introduce overhead.

⚠️ Gate-level simulation and post-implementation power analysis are:
- expensive
- technology-dependent
- unsuitable for early design decisions

This extension focuses on:
✔ **RTL-level estimation**  
✔ **Technology-agnostic modeling**  
✔ **Fast, proxy-based analysis**

---

## 🧩 Estimation Architecture
The estimation layer is integrated **passively** within the fault-tolerant
control subsystem and consists of the following components:

### 🔹 Activity Monitor
✔ Counts FSM state transitions  
✔ Tracks PC write toggles  
✔ Measures recovery-active cycles  

### 🔹 Power Estimator
✔ Maps activity counts to a **relative power proxy**  
✔ Uses configurable, unit-less weights  
✔ Avoids voltage, frequency, and process assumptions  

### 🔹 Performance Estimator
✔ Measures recovery-induced execution overhead  
✔ Computes integer-based overhead percentages  
✔ Operates without timing or clock-rate assumptions  

🔒 **All estimation outputs are observational only** and do **NOT** influence
control or datapath behavior.

---

## 📚 Research Alignment
This extension is inspired by and aligned with prior research on
early-stage estimation and design-space exploration:

### 🔸 Rajesh Kedia et al.
✔ Early evaluation of performance and energy trade-offs  
✔ Architectural-level analysis without exhaustive simulation  
✔ Motivation for lightweight, proxy-based estimation  

### 🔸 Amit Acharyya et al.
✔ RTL-level activity propagation for power estimation  
✔ Avoidance of gate-level simulation  
✔ Emphasis on fast, inductive estimation methodologies  

📌 The implementation reflects these ideas at the **control-logic level**
rather than datapath or circuit level.

---

## 🔍 Verification Strategy
✔ Incremental integration with **waveform regression checks**  
✔ Identical simulation behavior before and after integration  
✔ Elaborated design inspection confirms **non-intrusive operation**  

🛡 This ensures the estimation layer does **NOT** affect:
- functional correctness
- control flow
- timing behavior

---

## ⚠️ Limitations
❗ The estimated metrics represent **relative trends**, not absolute power  
❗ No technology-specific parameters (voltage, frequency, process) modeled  
❗ Does not replace gate-level or silicon measurements  

These limitations are **intentional** to preserve:
✔ early-stage applicability  
✔ architectural independence  

---

## 🔑 Key Takeaway
> **Fault-tolerant control behavior can be quantified at RTL for power and
performance trends without compromising correctness or requiring costly
post-implementation analysis.**
