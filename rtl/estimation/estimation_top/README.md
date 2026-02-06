# Day 25 – Estimation Layer: Architecture & Observation Hooks

## 📌 Overview
This task introduces the **Estimation Layer** for the fault-tolerant RTL subsystem.  
The estimation layer is a **non-intrusive observation framework** that taps key internal control signals to **estimate fault behavior, recovery efficiency, and system stability** without modifying functional RTL paths.

This layer is intended to support **analysis, profiling, and future automation** (coverage, statistics, and recovery scoring).

---

## 🎯 Objective
The primary goal of this day is to **define what must be observed** in the RTL to accurately estimate:
- Control flow disruptions
- Recovery activity
- Freeze and resume behavior
- Fault-handling effectiveness

No functional logic is altered in this stage.

---


The `estimation/` directory acts as a **logical layer** for all future:
- Observation hooks
- Monitors
- Counters
- Metrics collectors

---

## 🔍 Observation Scope
The estimation layer focuses exclusively on **control-plane signals** that indicate system health and recovery behavior.

### 1️⃣ FSM State Observation
**Purpose:**  
Monitor control state transitions during:
- Normal execution
- Fault entry
- Recovery sequences

**Why it matters:**  
Abnormal or repeated state transitions indicate instability or ineffective recovery.

---

### 2️⃣ `control_freeze`
**Purpose:**  
Observe when pipeline or control logic is intentionally frozen.

**Why it matters:**  
- Measures how often execution is paused due to faults
- Helps estimate performance impact of fault handling

---

### 3️⃣ `recovery_action`
**Purpose:**  
Track which recovery mechanism is invoked.

**Why it matters:**  
- Differentiates between light vs aggressive recovery
- Enables recovery success and frequency analysis

---

## 🧠 Design Philosophy
- **Read-only observation** (no signal driving)
- **Zero functional interference**
- **Scalable hooks** for future metrics
- **RTL-friendly** and synthesis-safe

This ensures the estimation layer can be enabled or disabled without impacting core behavior.

---

## 🚀 Future Extensions
This architecture enables future additions such as:
- Recovery latency estimation
- Freeze duration counters
- Fault-to-recovery correlation metrics
- Coverage-driven reliability scoring

---

## ✅ Completion Status
- Estimation layer directory created
- Observation signals identified and documented
- Architectural intent clearly defined

---


## 🏁 Summary
Day 25 establishes the **foundation for fault-awareness analytics** by clearly defining *what to observe* and *why it matters*.  
This sets the stage for adding monitors, counters, and intelligent estimation logic in upcoming tasks.
