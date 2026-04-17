If you use this code in your project, a credit/mention would be appreciated. Please reach out and contribute if you can!

**Note:** This is a personal working repository. If you're not comfortable with manual Klipper configuration, custom kinematics, and potential hardware troubleshooting, this probably isn't for you.

# K1 Max Custom Enhancements

This repository contains custom modifications, optimized binaries, and configuration backups specifically tailored for the Creality K1 Max. 

While these modules are designed to be "drop-in" for printers using the **Creality Helper Script**, some components (specifically Limited CoreXY and MPC) require manual adjustments to your `printer.cfg`.

> [!CAUTION]
> **Safety First:** Always backup your existing configuration files before applying changes. Modification of fan pinouts or kinematics can lead to hardware damage if not properly verified. It's a good idea to add a wait condition to the Klipper stack on start up, this will give a window where you can ssh in and kill the process if you cause a soft brick. You can also stop klipper from auto-starting and call it manually. 

## 🛠 Features & Modules

### Klippy Extensions (`klippy/extras`)
* **MPC (Model Predictive Control):** Advanced temperature management for improved thermal stability.
* **Z-axis:** Optimized Z-motion handling - Z-axis has basis for input shaping - needs external adxl. Possible code for height restrictive speed adjustment, not checked could still be on build machine.
* **Input Shaper Tweaks:** Fine-tuned resonance compensation - Sweeping motion and changes to pulse generator.

### Kinematics (`klippy/kinematics`)
* **Limited CoreXY:** Modified kinematics logic for specialized motion control.

### Performance Optimizations
* **Optimized Python 3.8.20:** A custom-compiled Python runtime designed as a drop-in replacement, specifically optimized for the **Ingenic X2000 (MIPS)** architecture, utilizing **MSA/Vector instructions** to increase performance. Tested via symlink override on `/usr/data` partition. If you fully integrate it into the system - here be dragons!
* **Enhanced `c_helper.so`:** Pre-compiled with experimental efficiency improvements for low-level Klippy operations.

## 📂 Repository Structure

* `/config`: Stable `printer.cfg` examples and backups.
* `/klippy/extras`: Custom Python modules for Klipper.
* `/klippy/chelper`: Optimized C components.
* `/klippy/kinematics`: Specialized motion class files.

## 🔧 Installation Notes

1. **Dependencies:** Ensure you have the [Creality Helper Script](https://github.com/Guilouz/Creality-K1-Series) environment installed. Stock systems and Simple AF firmware will work, but will need modifications to printer config files.
2. **Fan Pinouts:** Repinning fans can be complex depending on your specific board revision. Refer to the provided `.cfg` files for validated pin mapping examples. (MPC requires a 'shadow fan' in order to link with)
3. **Manual Integration:** Modules like MPC and Limited CoreXY require you to manually add the corresponding sections to your `printer.cfg`.

## 🙏 Acknowledgments

* **[Creality Helper Script](https://github.com/Guilouz/Creality-K1-Series)** - Foundation for K1 Series modifications
* **[Simple AF Firmware](https://github.com/pellcorp/creality)** - Creality firmware enhancements
* **[Kalico Development Team](https://github.com/KalicoCrew/kalico)** - Advanced Klipper features and improvements
* **[Klipper Development Team](https://github.com/klipper3d/klipper)** - For the exceptional 3D printer firmware
* And anyone else whose work contributed to this project!

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
