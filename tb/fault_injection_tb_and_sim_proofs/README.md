# Fault Injection Testbench — Day-8

## 📌 Objective
This task validates the correctness of the **fault detection logic** by
deliberately injecting illegal and unsafe conditions at the testbench level.

The goal is **verification only**:
- ✔ Prove that the detector responds correctly
- ❌ No fault correction or recovery is implemented here

This approach aligns with industry-standard verification practices, where
detection is validated independently before integration into response logic.

---

## 🧠 Test Strategy
Faults are injected directly in the **testbench** by forcing control and
decode signals into invalid states.  
This allows deterministic and repeatable validation without modifying RTL.

### Injected Fault Scenarios
- **Invalid opcode injection**
  - Unsupported opcode values driven into the detector
- **Illegal control combinations**
  - `mem_read` and `mem_write` asserted simultaneously
  - `reg_write` asserted for invalid instruction conditions

Each scenario is designed to violate the RTL rules defined in **Day-6**.

---

## ⚙️ Design Characteristics
- Purely testbench-driven fault injection
- No clock or sequential manipulation
- Deterministic stimulus generation
- Focused observation of `fault_detected`

---

## 🔍 Expected Behavior
| Condition Injected                     | Expected Output |
|---------------------------------------|-----------------|
| Unsupported opcode                    | `fault_detected = 1` |
| Illegal control combination           | `fault_detected = 1` |
| Valid opcode + legal control signals  | `fault_detected = 0` |

Correct toggling of `fault_detected` confirms proper rule enforcement.

---

## 🧪 Verification Evidence
The following verification artifacts are included:

### ✔ Simulation Proof
- Behavioral simulation waveform captures
- Demonstrates real-time assertion of `fault_detected`

### ✔ Structural Proof
- RTL elaborated schematic
- Confirms correct logical connectivity and combinational structure

📁 **Proof Location**
- `fault_injection_waveform.png`
- `fault_injection_elaborated.png`

---

## 🧩 Engineering Significance
- Demonstrates **verification-driven design thinking**
- Confirms fault detector correctness under illegal conditions
- Provides confidence before higher-level system integration
- Reflects safety-aware RTL verification methodology

---

## 📈 Status
- Fault injection testbench completed  
- Illegal conditions successfully detected  
- Detector behavior verified and documented  

**Module is ready for integration into system-level fault handling logic.**
