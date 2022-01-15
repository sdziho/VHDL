library ieee;
use ieee.std_logic_1164.all;

entity lab3_zad2 is
	generic(N : integer := 3);	
	port(
		syn_clr, load, en, up, clock, reset : in std_logic;
		KEY_d : in std_logic_vector(N-1 downto 0);
		LED_max, LED_min : out std_logic;
		LED_q : out std_logic_vector(N-1 downto 0)
	);
end lab3_zad2;

architecture zad2_arch of lab3_zad2 is
begin
	brojac : entity work.univerzalni_brojac
		generic map(N => N)
		port map(
			syn_clr => syn_clr,
			load => load, 
			en => en, 
			up => up, 
			clk => clock, 
			reset => reset, 
			d => KEY_d, 
			max_tick => LED_max, 
			min_tick => LED_min, 
			q => LED_q
		);
end zad2_arch;
