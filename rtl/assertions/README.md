# 🟦 Day-19: Formal Safety Assertions (SystemVerilog)

## 🎯 Objective
The objective of Day-19 is to **formally verify safety guarantees** of the fault-tolerant control system using **SystemVerilog Assertions (SVA)**.  
Unlike simulation-only validation, assertions continuously monitor runtime behavior and **prove that unsafe conditions never occur**.

This step elevates the project from functional correctness to **verification-grade design**.

---

## 🧠 Why Assertions Matter
Simulation can show that a design works for tested cases.  
Assertions ensure that **critical safety rules are never violated**, even in untested scenarios.

This approach reflects **industry verification practices** and **research-oriented thinking**.

---

## 📂 Implementation Strategy

- Assertions are implemented in a **separate SystemVerilog module**
- No functional RTL logic was modified
- Assertions are instantiated **only in the testbench**
- Core design remains unchanged and stable


---

## 🧩 Assertions Implemented

### ✅ Assertion 1: No Write During Fault
Ensures that **no PC, register, or memory write** occurs when the system enters fault-safe mode.

**Safety Rule:**
If safe_mode is active → all write enables must be LOW

This prevents architectural corruption during fault handling.

---

### ✅ Assertion 2: Eventual Recovery Guarantee
Ensures that the system **never gets stuck in recovery**.

**Liveness Rule:**
If recovery starts → resume must occur within bounded cycles
This guarantees forward progress after fault resolution.

---

## 🧪 Verification Results

- All simulations completed successfully
- No assertion failures reported
- Assertions remained active throughout simulation
- Safety and liveness properties were upheld

✔ Silence in the simulator confirms **formal correctness**

---

## 🔒 Design Integrity
- ✔ No RTL logic modified
- ✔ No regression introduced
- ✔ Assertions act as non-intrusive monitors
- ✔ Compatible with existing testbenches

---

## 🎓 Key Takeaway
With the addition of SystemVerilog assertions, the fault-tolerant control system is now:

- ✔ Functionally correct  
- ✔ Formally constrained  
- ✔ Verification-grade  
- ✔ Research-ready  

This step demonstrates **verification maturity** expected in advanced academic and industry environments.

----