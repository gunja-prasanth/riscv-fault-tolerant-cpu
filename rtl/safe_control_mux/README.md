# 🟦 Day-15: Safe Control MUX

---

## 🎯 Objective
The objective of **Day-15** is to implement the **final safety layer** in the control path by
selecting between **normal control signals** and **safe control signals**, with **absolute priority given to safety**.

This module ensures that even if upstream logic fails, the CPU always operates in a **safe mode during faults**.

---

## 🛡️ Why Safe Control MUX is Needed

In a fault-tolerant CPU:
- Normal control logic may generate unsafe signals
- Recovery or fault logic may request safer alternatives
- A **single point of enforcement** is required to guarantee safety

➡️ The Safe Control MUX acts as the **last line of defense** before control signals reach the datapath.

---

## 🧩 Functionality Overview

- When `safe_mode = 0`  
  ✅ Normal control signals are passed through

- When `safe_mode = 1`  
  🚨 Safe control signals **override** normal signals

Safety **always wins**, regardless of normal control behavior.

---

## 🔌 Module Inputs

### 🔹 Mode Select
| Signal | Description |
|------|-------------|
| `safe_mode` | Enables safe control override |

### 🔹 Normal Control Signals
| Signal | Description |
|------|-------------|
| `pc_write_normal` | Normal PC write enable |
| `reg_write_normal` | Normal register write enable |
| `mem_write_normal` | Normal memory write enable |

### 🔹 Safe Control Signals
| Signal | Description |
|------|-------------|
| `pc_write_safe` | Safe PC write enable |
| `reg_write_safe` | Safe register write enable |
| `mem_write_safe` | Safe memory write enable |

---

## 📤 Module Outputs

| Signal | Description |
|------|-------------|
| `pc_write_out` | Final PC write enable |
| `reg_write_out` | Final register write enable |
| `mem_write_out` | Final memory write enable |

---

## 🧠 RTL Behavior (Logic Summary)

if safe_mode == 1
pc_write_out = pc_write_safe
reg_write_out = reg_write_safe
mem_write_out = mem_write_safe
else
pc_write_out = pc_write_normal
reg_write_out = reg_write_normal
mem_write_out = mem_write_normal

---

## 🧱 Architecture View (ASCII)

pc_write_normal ──┐
├── MUX ──> pc_write_out
pc_write_safe ───┘
^
|
safe_mode

reg_write_normal ──┐
├── MUX ──> reg_write_out
reg_write_safe ───┘

mem_write_normal ──┐
├── MUX ──> mem_write_out
mem_write_safe ───┘

---

## 🧪 Verification

Behavioral simulation confirms:

✔ Normal signals pass through when `safe_mode = 0`  
✔ Safe signals override normal signals when `safe_mode = 1`  
✔ No write leakage during fault conditions  

📸 Waveform proof captured to validate **fault override behavior**.

---

