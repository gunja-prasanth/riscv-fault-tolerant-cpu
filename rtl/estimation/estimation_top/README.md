# 🔍 Estimation Layer (Phase-2 Extension)

➤ This module adds a **passive, activity-aware estimation layer** to the  
**fault-tolerant RISC-V control subsystem**.

---

## 🎯 Purpose
✔ Observe **control-level activity**  
✔ Estimate **relative power & performance cost**  
✔ Avoid **gate-level simulation**

---

## ⚙️ What It Does
✔ Counts **FSM state transitions**  
✔ Tracks **control signal toggles**  
✔ Measures **recovery-induced overhead**

---

## 🚫 What It Does NOT Do
✖ Does **NOT** control execution  
✖ Does **NOT** gate signals  
✖ Does **NOT** affect correctness

---

## 📚 Research Inspiration
➤ This layer is inspired by research on **early-stage design-space exploration**  
➤ and **RTL-based power & performance estimation techniques**.
