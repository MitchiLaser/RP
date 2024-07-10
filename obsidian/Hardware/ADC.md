The two analog inputs have different ranges for the input voltage that can be selected by moving jumpers on the RP:
1. LV range: $\pm\pu{1 V}$
2. HV range: $\pm\pu{20 V}$
An excerpt from the [Schematics](https://downloads.redpitaya.com/doc/Red_Pitaya_Schematics_v1.0.1.pdf) shows, that for both inputs a frequency compensated attenuator is being used to reduce the magnitude of the input signal. Between the input stage and the ADC a proprietary circuit is placed which is not disclosed in the documentation. It serves as a $\pu{50 MHz}$ lowpass filter and containes diodes to prevent the ADC from electronic discharges.

Both analog inputs are being read from the same ADC chip: the  [LTC2145CUP-14](https://www.analog.com/media/en/technical-documentation/data-sheets/21454314fa.pdf). The measured voltage is transferred over a $\pu{14 Bit}$ wide parallel data bus, connected to the GPIO Pins of the FPGA. The ADC is driven by a $\pu{125 MHz}$ clock placed on the RP. Alternatively the clock signal for the ADC can be selected from a PLL inside the FPGA or from an external device, connected to the SATA ports, by moving two resistors on the RP to a different location (voiding the waranty).
## Pin Assignments

### Clocks
|  Pin ADC  | Attached to (FPGA Pin) |
| :-------: | :--------------------: |
| CLKOUT +  |          U18           |
| CLKOUT -  |          U19           |
| AD_CLKSTB |          V18           |
The CLKOUT+ and CLKOUT- signals are shortened via a $\pu{1 K\Omega}$ resistor (R45).

**Clock duty cycle stabilizer** (AD_CLKSTB)
(extracted from the Datasheet, Page 23)
The ADC chip expects the input clock to have a $\pu{50 \% \pm{} 5 \%}$ duty cycle. If the clock duty cycle stabilizer is enabled, the duty cycle can vary from $\pu{30 \%}$ to $\pu{70 \%}$ and the duty cycle stabilizer tries to maintain a constant $\pu{50 \%}$ internal duty cycle. The internal PLL of the duty cycle stabilizer needs at least 100 clock cycles to lock in. When the sampling rate needs to be changed quickly, the duty cycle stabilizer can be disabled. It should not be used below $\pu{5 Msps}$.
### Digital Interface Channel 1

| Pin ADC | Attached to (FPGA Pin) |
| :-----: | :--------------------: |
|  D1_0   |          Y17           |
|  D1_1   |          W16           |
|  D1_2   |          Y16           |
|  D1_3   |          W15           |
|  D1_4   |          W14           |
|  D1_5   |          Y14           |
|  D1_6   |          W13           |
|  D1_7   |          V12           |
|  D1_8   |          V13           |
|  D1_9   |          T14           |
|  D1_10  |          T15           |
|  D1_11  |          V15           |
|  D1_12  |          T16           |
|  D1_13  |          V16           |
|  D1_-1  |     (Not used) U17     |
|  D1_-2  |     (Not used) V17     |
### Digital Interface Channel 2

| Pin ADC | Attached to (FPGA Pin) |
| :-----: | :--------------------: |
|  D2_0   |          R18           |
|  D2_1   |          P16           |
|  D2_2   |          P18           |
|  D2_3   |          N17           |
|  D2_4   |          R19           |
|  D2_5   |          T20           |
|  D2_6   |          T19           |
|  D2_7   |          U20           |
|  D2_8   |          V20           |
|  D2_9   |          W20           |
|  D2_10  |          W19           |
|  D2_11  |          Y19           |
|  D2_12  |          W18           |
|  D2_13  |          Y18           |
|  D2_-1  |     (Not used) R16     |
|  D2_-2  |     (Not used) T17     |
