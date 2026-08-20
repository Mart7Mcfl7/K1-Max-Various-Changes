Attempt to re-write PR touch bed-leveling .py's in order to use on mainline

work in progress, not ready

K1_load_cell_probe = multiple hx11 support for mainline/kalico - needs flash to bed mcu but klipper should be happy with four load cell config, added corener aggregation

default configs;


Minimal printer.cfg

  [k1_load_cell_probe]
  sensor_type: hx711
  corner_dout_pins: leveling_mcu:PA0, leveling_mcu:PA1, leveling_mcu:PA3,
  leveling_mcu:PA4
  corner_sclk_pins: leveling_mcu:PA2, leveling_mcu:PA5, leveling_mcu:PA6,
  leveling_mcu:PA7
  z_offset: 0.0
  speed: 2.0
  samples: 3

  [stepper_z]
  endstop_pin: probe:z_virtual_endstop

The physical pins are identical, but the pin order is arranged differently between the two configs.

**Pin Mapping Comparison**

| Sensor / Corner | Stock `[prtouch_v2]` | `[k1_load_cell_probe]` |
| --- | --- | --- |
| **Sensor 0** | `clk`: PA5, `sdo`: PA1 | `clk`: PA2, `dout`: PA0 |
| **Sensor 1** | `clk`: PA2, `sdo`: PA0 | `clk`: PA5, `dout`: PA1 |
| **Sensor 2** | `clk`: PA6, `sdo`: PA3 | `clk`: PA6, `dout`: PA3 |
| **Sensor 3** | `clk`: PA7, `sdo`: PA4 | `clk`: PA7, `dout`: PA4 |

* The 4 data pins (**PA0, PA1, PA3, PA4**) and 4 clock pins (**PA2, PA5, PA6, PA7**) on `leveling_mcu` are the exact same physical GPIOs.
* Notice that `pres0` and `pres1` from stock are swapped in index order compared to the list in `[k1_load_cell_probe]` (`PA0/PA2` vs `PA1/PA5`).
