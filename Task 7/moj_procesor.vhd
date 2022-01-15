library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity moj_procesor is
	generic(linija: integer :=4 ;
				vel: integer := 11);
	port(
		clk, reset, par_upis, stack_in, stack_out: in std_logic;
		adr, stack_ulaz: in std_logic_vector(linija-1 downto 0);
		izlaz: out std_logic_vector(vel-1 downto 0)
	);
end moj_procesor;

architecture arch of moj_procesor is
signal temp,stack_izlaz, pom_adr: std_logic_vector(linija-1 downto 0);
signal var: std_logic_vector(linija-1 downto 0);
signal upis: std_logic:='0';
begin
	pr_brojac : entity work.programski_brojac
				 generic map (N =>linija)
				 port map(clk => clk, reset => reset, upis => par_upis, adr => pom_adr, PC => temp);
	rom : entity work.rom
				 generic map(linija => linija ,vel => vel)
				 port map(adresa => temp, izlaz => izlaz); 
	
	var <= std_logic_vector(unsigned(temp));
	stack: entity work.stack
				 port map(stack_in => stack_in,
							 stack_out => stack_out,
							 address_in => var,
							 address_out=> stack_izlaz);
	pom_adr <= stack_ulaz when stack_in='1' else
				  stack_izlaz when stack_out='1' else
				  adr;
	upis <= stack_in or stack_out or par_upis;
end arch;
