# PC Control Logic (Day-4)

## Objective
Design and verify Program Counter (PC) control logic for a RISC-V CPU.

This module controls how the PC updates under different conditions such as
normal execution, hold, reset, and redirection.

## Functionality
- Normal PC increment (PC + 4)
- PC hold support
- Reset handling
- PC redirection support (for branches/jumps – future use)

## Design Details
- Synchronous PC update on clock edge
- Priority-based control:
  1. Reset
  2. Redirect
  3. Hold
  4. Normal increment

## Verification
- Behavioral simulation performed in Vivado
- Waveform confirms correct PC behavior for:
  - Increment
  - Hold
  - Redirect

## Proof
Simulation and elaborated RTL design screenshots are available 

# PC Control Logic (Day-4)

## Objective
Design and verify Program Counter (PC) control logic for a RISC-V CPU.

This module controls how the PC updates under different conditions such as
normal execution, hold, reset, and redirection.

## Functionality
- Normal PC increment (PC + 4)
- PC hold support
- Reset handling
- PC redirection support (for branches/jumps – future use)

## Design Details
- Synchronous PC update on clock edge
- Priority-based control:
  1. Reset
  2. Redirect
  3. Hold
  4. Normal increment

## Verification
- Behavioral simulation performed in Vivado
- Waveform confirms correct PC behavior for:
  - Increment
  - Hold
  - Redirect

## Proof
Simulation and elaborated RTL design screenshots are available in:


## Status
✅ RTL implemented  
✅ Simulation verified  
✅ PC control logic working as expected


