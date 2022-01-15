library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity moj_procesor is
	generic(linija: integer :=4 ;
				vel: integer := 11);
	port(
		clk, reset: in std_logic
	);
end moj_procesor;

architecture arch of moj_procesor is
signal temp,stack_izlaz, pom_adr: std_logic_vector(linija-1 downto 0);
signal var: std_logic_vector(linija-1 downto 0);
signal upis: std_logic:='0';
signal inst_reg_pom: std_logic_vector(vel-1 downto 0);
signal status_pom: std_logic_vector(3 downto 0);
signal izlaz: std_logic_vector(vel-1 downto 0);
signal par_upis, stack_in, stack_out: std_logic;
signal address: std_logic_vector(linija-1 downto 0);
begin
	pr_brojac : entity work.programski_brojac
				 generic map (N =>linija)
				 port map(clk => clk, reset => reset, upis => upis, adr => pom_adr, PC => temp);
	rom : entity work.rom
				 generic map(linija => linija ,vel => vel)
				 port map(adresa => temp, izlaz => izlaz); 
	
	var <= std_logic_vector(unsigned(temp)+1);
	stack: entity work.stack
				 port map(stack_in => stack_in,
							 stack_out => stack_out,
							 address_in => var,
							 address_out=> stack_izlaz);
	pom_adr <= stack_izlaz when stack_out='1' else
				  address;
	upis <= stack_in or stack_out or par_upis;
	
	I_R: entity work.I_R
				port map(
					clk => clk,
					data => izlaz,
					instrukcijski_registar => inst_reg_pom
				);
	registar_stanja: entity work.registar_stanja
				port map(
					clk => clk,
					paralelni_upis => upis,
					status => status_pom
				);
	u_jed: entity work.u_jed
				port map(
					status => status_pom,
					instrukcijski_registar => inst_reg_pom,
					stack_in => stack_in,
					stack_out => stack_out,
					paralelni_upis1 => par_upis,
					adresa_in1 => address
				);
end arch;
