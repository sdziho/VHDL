library ieee;
use ieee.std_logic_1164.all;

entity lab3_zad1 is
	port(
		KEY3 : in std_logic; 
		KEY0 : in std_logic; 
		LED_max : out std_logic;
		LED : out std_logic_vector(2 downto 0)
	);
end lab3_zad1;

architecture zad1_arch of lab3_zad1 is
begin
	brojac : entity work.brojac_po_modulu
		port map(
			clk => KEY0, reset => KEY3, max_tick => LED_max, q => LED(2 downto 0)
		);
end zad1_arch;
