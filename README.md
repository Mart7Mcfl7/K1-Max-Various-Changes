# K1-Max-Various-Changes

Custom modifications and backups for the Creality K1 Max.

Most modules should be drop in, limited core xy and mpc will need changes to printer.cfg
Depending on printer setup, repinning fans can be tricky, please reffer to the provided .cfg for examples.
Always make a backup of any files in case you need to restore to a working config.

## Current Modules:
* **Z-axis Bypass & Input Shaper Tweaks** (Located in klippy/extras)
* **Model Predictive Control (MPC)** (Located in klippy/extras)
* **Limited CoreXY Kinematics** (Located in klippy/kinematics)
* **Printer Config Backup** (Located in config)

## Added:
* **Compiled c_helper.so with experimental changes. Should be more efficient (klippy/chelper)
