library ieee;
use ieee.std_logic_1164.all;

entity moj_procesor is
	generic(linija: integer :=4 ;
			vel: integer := 11);
	port(
		clk: in std_logic;
		reset: in std_logic;
		upis: in std_logic;
		adr: in std_logic_vector(linija-1 downto 0);
		izlaz: out std_logic_vector(vel-1 downto 0)
	);
end moj_procesor;

architecture arch of moj_procesor is
signal temp: std_logic_vector(linija-1 downto 0);
begin
	pr_brojac : entity work.programski_brojac
				 generic map (N =>linija)
				 port map(clk => clk, reset => reset, upis => upis, adr => adr, PC => temp);
	rom : entity work.rom
				 generic map(linija => linija ,vel=>vel)
				 port map(adresa => temp, izlaz => izlaz); 
end arch;
