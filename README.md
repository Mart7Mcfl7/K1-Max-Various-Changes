K1 Max Custom Enhancements
This repository contains custom modifications, optimized binaries, and configuration backups specifically tailored for the Creality K1 Max.

While these modules are designed to be "drop-in" for printers using the Creality Helper Script, some components (specifically Limited CoreXY and MPC) require manual adjustments to your printer.cfg.

[!CAUTION]
Safety First: Always backup your existing configuration files before applying changes. Modification of fan pinouts or kinematics can lead to hardware damage if not properly verified.

🛠 Features & Modules
Klippy Extensions (klippy/extras)
MPC (Model Predictive Control): Advanced temperature management for improved thermal stability.

Z-axis Bypass: Optimized Z-motion handling. (not implimented rn)

Input Shaper Tweaks: Fine-tuned resonance compensation for cleaner prints.

Kinematics (klippy/kinematics)
Limited CoreXY: Modified kinematics logic for specialized motion control.

Performance Optimizations
Optimized Python 3.8.20: A custom-compiled Python runtime designed as a drop-in replacement. It is specifically optimized for the Ingenic X2000 (MIPS) architecture, utilizing MSA/Vector instructions to reduce CPU overhead.

Enhanced c_helper.so: Pre-compiled with experimental efficiency improvements for low-level Klippy operations.

📂 Repository Structure
/config: Stable printer.cfg examples and backups.

/klippy/extras: Custom Python modules for Klipper.

/klippy/chelper: Optimized C components.

/klippy/kinematics: Specialized motion class files.

🔧 Installation Notes
Dependencies: Ensure you have the Creality Helper Script environment installed.

Fan Pinouts: Repinning fans can be complex depending on your specific board revision. Please refer to the provided .cfg files for validated pin mapping examples.

Manual Integration: Modules like MPC and Limited CoreXY require you to manually add the corresponding sections to your printer.cfg.
