library ieee;
use ieee.std_logic_1164.all;

entity lab4_zad1 is 
	port(
		clk, reset: in std_logic;
		level: in std_logic;
		tick: out std_logic
	);
end lab4_zad1;

architecture arch_lab4_zad1 of lab4_zad1 is
begin
	edge_ex : entity work.edge_detector(edge_detector_arch)
				 port map(reset => reset, clk => clk, level => level, tick => tick);
		
end arch_lab4_zad1;