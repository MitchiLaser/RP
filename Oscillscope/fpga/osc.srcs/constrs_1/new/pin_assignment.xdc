### ADC

## clock input

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports adc_clk_n]
set_property PACKAGE_PIN U18 [get_ports adc_clk_p]
set_property PACKAGE_PIN U19 [get_ports adc_clk_n]

## clock duty cycle stabilizer

set_property IOSTANDARD LVCMOS18 [get_ports adc_csn]
set_property PACKAGE_PIN V18 [get_ports adc_csn]
set_property SLEW FAST [get_ports adc_csn]
set_property DRIVE 8 [get_ports adc_csn]

## Channel A

set_property IOSTANDARD LVCMOS18 [get_ports {CHA[*]}]
set_property IOB TRUE [get_ports {CHA[*]}]

set_property PACKAGE_PIN Y17 [get_ports {CHA[0]}]
set_property PACKAGE_PIN W16 [get_ports {CHA[1]}]
set_property PACKAGE_PIN Y16 [get_ports {CHA[2]}]
set_property PACKAGE_PIN W15 [get_ports {CHA[3]}]
set_property PACKAGE_PIN W14 [get_ports {CHA[4]}]
set_property PACKAGE_PIN Y14 [get_ports {CHA[5]}]
set_property PACKAGE_PIN W13 [get_ports {CHA[6]}]
set_property PACKAGE_PIN V12 [get_ports {CHA[7]}]
set_property PACKAGE_PIN V13 [get_ports {CHA[8]}]
set_property PACKAGE_PIN T14 [get_ports {CHA[9]}]
set_property PACKAGE_PIN T15 [get_ports {CHA[10]}]
set_property PACKAGE_PIN V15 [get_ports {CHA[11]}]
set_property PACKAGE_PIN T16 [get_ports {CHA[12]}]
set_property PACKAGE_PIN V16 [get_ports {CHA[13]}]

## Channel B

set_property IOSTANDARD LVCMOS18 [get_ports {CHB[*]}]
set_property IOB TRUE [get_ports {CHB[*]}]

set_property PACKAGE_PIN R18 [get_ports {CHB[0]}]
set_property PACKAGE_PIN P16 [get_ports {CHB[1]}]
set_property PACKAGE_PIN P18 [get_ports {CHB[2]}]
set_property PACKAGE_PIN N17 [get_ports {CHB[3]}]
set_property PACKAGE_PIN R19 [get_ports {CHB[4]}]
set_property PACKAGE_PIN T20 [get_ports {CHB[5]}]
set_property PACKAGE_PIN T19 [get_ports {CHB[6]}]
set_property PACKAGE_PIN U20 [get_ports {CHB[7]}]
set_property PACKAGE_PIN V20 [get_ports {CHB[8]}]
set_property PACKAGE_PIN W20 [get_ports {CHB[9]}]
set_property PACKAGE_PIN W19 [get_ports {CHB[10]}]
set_property PACKAGE_PIN Y19 [get_ports {CHB[11]}]
set_property PACKAGE_PIN W18 [get_ports {CHB[12]}]
set_property PACKAGE_PIN Y18 [get_ports {CHB[13]}]

