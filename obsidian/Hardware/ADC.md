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
## Digital Data Format
The ADC has two modes in which it returns the acquired data:
1. Offset binary mode: The voltage of $\pu{0 V}$ is shifted to the value $0x2000$. All positive voltages are added to this offset and all negative voltages are subtracted from it so that a voltage of $\geq \pu{1 V}$ is equal to $0x3FFF$ and a voltage of $\leq \pu{-1 V}$ is equal to $0x0000$. The overflow bits cannot be used because they are not connected to the FPGA on the RP.
2. 2's complement: by setting the serial programming register A4, the output format can be selectet to the two's complement.
On the RP the ADC is in the Offset binary mode becuause accessing the SPI pins for serial programming is not possible as these pins are not connected to anything.

### Conversion from Offset binary representation to 2's complement.
As already mentioned the data is returned in the offset binary representation by the ADC. To convert the sampled value into 2's complement the raw adc values needs to be treated as an unsigned integer from which the constant offset is being subtracted with the result being treated as a signed integer.
$$
two\_comp = std\_logic\_vector( signed(unsigned(offs\_bin) - 0x2000) )
$$
(a Pseudo-Code depiction of the procedure)

