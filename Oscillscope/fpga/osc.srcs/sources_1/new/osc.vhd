library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity osc is
    generic(
        ADC_Word_Width : positive := 14  -- word width in bits
    );
    port (
        CHA, CHB : in std_logic_vector(ADC_Word_Width-1 downto 0);
        adc_clk_p, adc_clk_n : in std_logic;
        adc_csn : out std_logic
    );
end osc;

architecture rtl of osc is

begin
    

    -- assign adc clock duty cycle stabilizer to constantly 1
    adc_csn <= '1';
end rtl;
