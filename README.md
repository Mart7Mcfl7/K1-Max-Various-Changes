# Welcome to the K1maXburst Project

It's known that the K1 series of printers are hard to mod and update since they use proprietary code. The developers also created the firmware the easy way - they didn't optimize for the architecture of the chip effectively, causing a common belief that the hardware is weak.

The CPU in the printer is an Ingenic X2000 and has some pretty fancy features if you can enable them (XBurst2 core, FPU, MSA vector instructions). This means a lot of performance can be gained in math-heavy tasks like input shaping and motion planning.

I've aimed to correct this common misconception by activating these features to gain free performance. It's a time-consuming task, but hopefully if people realize the effectiveness of these instruction sets, I can get some help.

Thanks for reading.

If you use anything here, a credit/mention would be appreciated. Please reach out and contribute if you can!

---

**Note:** This is a personal working repository. If you're not comfortable with manual Klipper configuration, custom kinematics, and potential hardware troubleshooting, this probably isn't for you. This repository helps me keep things orginised as my build enviroment is a mess and sometimes things get nuked by accident.

# K1maXburst - K1 Max Performance Enhancements

This repository contains custom modifications, optimized binaries, and configuration backups specifically tailored for the Creality K1 Max. 

While these modules are designed to be "drop-in" for printers using the **Creality Helper Script**, some components (specifically Limited CoreXY and MPC) require manual adjustments to your `printer.cfg`.

Tested with Grumpy/Guppy screen, Helix_screen and stock Creality binaries.

---

> [!CAUTION]
> **Safety First:** Always backup your existing files before applying changes. Modification of fan pinouts or kinematics can lead to hardware damage if not properly verified. It's a good idea to add a wait condition to the Klipper stack on start up, this will give a window where you can ssh in and kill the process if you cause a soft brick. You can also stop klipper from auto-starting and call it manually.

---

## 🛠 Features & Modules

### Klippy Extensions (`klippy/extras`)
* **MPC (Model Predictive Control):** Advanced temperature management for improved thermal stability.
* **Z-axis:** Optimized Z-motion handling - Z-axis has basis for input shaping - needs external ADXL. Possible code for height-restrictive speed adjustment, not checked could still be on build machine.
* **Input Shaper Tweaks:** Fine-tuned resonance compensation - Sweeping motion and changes to pulse generator.

### Kinematics (`klippy/kinematics`)
* **Limited CoreXY:** Modified kinematics logic for specialized motion control.

### Performance Optimizations
* **Optimized Python 3.8.20:** A custom-compiled Python runtime designed as a drop-in replacement, specifically optimized for the **Ingenic X2000 (MIPS)** architecture, utilizing **MSA/Vector instructions** to increase performance. Tested via symlink override on `/usr/data` partition. If you fully integrate it into the system - here be dragons!
* **Enhanced `c_helper.so`:** Pre-compiled with experimental efficiency improvements for Klippy operations. Tested, has been in use for months with no instability.

### 🎮 Bonus: Doom Port
* **Doom for the Creality K1:** Runs on the printer's display. No sound yet. Known issue: shotgun bug (will fix). Because if it can run Doom, the hardware isn't weak. 😎

## 📂 Repository Structure

* `/config`: Stable `printer.cfg` examples and backups.
* `/klippy/extras`: Custom Python modules for Klipper.
* `/klippy/chelper`: Optimized C components.
* `/klippy/kinematics`: Specialized motion class files.
* `/doom`: Doom port for K1 Max display.

## 🔧 Installation Notes

1. **Dependencies:** Ensure you have the [Creality Helper Script](https://github.com/Guilouz/Creality-K1-Series) environment installed. Stock systems and Simple AF firmware will work, but will need modifications to printer config files.
2. **Fan Pinouts:** Repinning fans can be complex depending on your specific board revision. Refer to the provided `.cfg` files for validated pin mapping examples. (MPC requires a 'shadow fan' in order to link with)
3. **Manual Integration:** Modules like MPC and Limited CoreXY require you to manually add the corresponding sections to your `printer.cfg`.

---
TODO: 

* **compile scipy**, feel generic xcompile version isnt great without vector math.
* **Explore running custom Linux distro from usb, bypassing creality (minimise brick risk)
* **Shoehorn better shapers in, Kalico Bleeding Edge shapers confirmed working, but again needs vector optimisation (scalar FPU too slow)
---

## 🙏 Acknowledgments

* **[Creality Helper Script](https://github.com/Guilouz/Creality-K1-Series)** - Foundation for K1 Series modifications
* **[Simple AF Firmware](https://github.com/pellcorp/creality)** - Creality firmware enhancements
* **[Kalico Development Team](https://github.com/KalicoCrew/kalico)** - Advanced Klipper features and improvements
* **[Klipper Development Team](https://github.com/klipper3d/klipper)** - For the exceptional 3D printer firmware
* **[Helix Screen](https://github.com/prestonbrown/helixscreen)** - Great screen addition using LVGL backend
* **id Software** - For Doom (obviously)
* And anyone else whose work contributed to this project!

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
