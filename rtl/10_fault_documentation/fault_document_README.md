# 🟦 Day-10: Fault Documentation

---

## 🎯 Objective
The objective of Day-10 is to provide **clear, structured, and professor-ready documentation**
for the fault classification logic implemented earlier.

This documentation explains:
- What faults exist  
- How they are classified  
- How priority is enforced  
- How this logic fits into a fault-tolerant CPU  

No RTL changes are made on this day.

---

## 🧩 Fault Categories

| Fault Type | Code | Description |
|-----------|------|-------------|
| No Fault | `00` | Normal CPU operation |
| Minor Fault | `01` | Recoverable or non-fatal fault |
| Critical Fault | `10` | Severe hardware fault |

---

## 🔌 Fault Signals Description

| Signal Name | Meaning |
|------------|--------|
| `illegal_opcode` | Unsupported or invalid instruction detected |
| `invalid_control` | Illegal or unsafe control signal combination |
| `stuck_at_fault` | Permanent hardware failure |

---

## 🥇 Fault Priority Rule

Faults are classified using a **strict priority hierarchy**:

CRITICAL FAULT
|
v
MINOR FAULT
|
v
NO FAULT
This guarantees that **critical hardware failures always dominate** over minor issues.

---

## 🧠 RTL Decision Logic (Human View)

if stuck_at_fault == 1
→ fault_type = 10 (CRITICAL)
else if illegal_opcode == 1 OR invalid_control == 1
→ fault_type = 01 (MINOR)
else
→ fault_type = 00 (NO FAULT)
---

## 🧱 Architecture Diagram (ASCII)

            +----------------------+
illegal_opcode ─┐ |
| |
invalid_control ├──> OR ─────────┐ |
| | |
+----------------+ |
v
+-------------+
stuck_at_fault ───────────────>| PRIORITY |───> fault_type[1:0]
| MUX |
+-------------+
---

## 🧩 System Integration View

       +----------------------+
       |  Instruction Decode  |
       +----------+-----------+
                  |
                  v
       +----------------------+
       | Fault Detection Logic|
       +----------+-----------+
                  |
                  v
       +----------------------+
       | Fault Classification |
       |  (This Module)       |
       +----------+-----------+
                  |
                  v
       +----------------------+
       | Recovery / Control   |
       +----------------------+

---

## 📌 Why This Design is Robust

✔ Deterministic priority handling  
✔ No overlapping fault ambiguity  
✔ Fully synthesizable  
✔ Easily extensible for future fault types  
✔ Suitable for safety-critical systems  

----