library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab4_zad2 is
	port(
		reset: in std_logic;
		clk: in std_logic;
		senz1: in std_logic;
		senz2: in std_logic;
		count : out integer
	);
end lab4_zad2;

architecture arch of lab4_zad2 is 
	signal pocetna : integer := 9;
	signal nap,naz : std_logic;
begin
	ex1 : entity work.parking
			port map(reset =>reset, clk =>clk, senz1 => senz1, senz2 =>senz2, naprijed =>nap, nazad =>naz);
	
	ex2 : entity work.univerzalni_brojac
			generic map(N => 7)
			port map(clk => clk, reset => reset, up => nap, down =>naz, q => count);

end arch;