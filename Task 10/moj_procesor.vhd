library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity moj_procesor is
	generic(adr_bit: integer :=4 ;duzina: integer := 11);
	port(
		clk, reset: in std_logic
	);
end moj_procesor;

architecture arch of moj_procesor is
signal brojac,izlaz_stack, addressa: std_logic_vector(adr_bit-1 downto 0);
signal pom: std_logic_vector(adr_bit-1 downto 0);
signal upis: std_logic:='0';
signal inst_reg_pom: std_logic_vector(duzina-1 downto 0);
signal status_pom: std_logic_vector(3 downto 0);
signal rom_izlaz: std_logic_vector(duzina-1 downto 0);
signal par_upis, stack_in, stack_out: std_logic;
signal address: std_logic_vector(adr_bit-1 downto 0);

signal upis_k, upis_r :std_logic;
signal adr_ram_dir: std_logic_vector(adr_bit-1 downto 0);
signal izbor1 : std_logic_vector(2 downto 0);
signal konstanta: std_logic_vector(7 downto 0);
signal izlaz: std_logic_vector(7 downto 0);

signal akA, akB, akC, akD: std_logic_vector(7 DOWNTO 0);
signal ins_kod : std_logic_vector(3 DOWNTO 0);

begin
	programski_brojac : entity work.programski_brojac
				 generic map (N =>adr_bit)
				 port map(
						clk => clk,
						reset => reset, 
						par_upis => upis, 
						address => addressa, 
						PC => brojac
				 );
	rom_memorija : entity work.rom
				 generic map(adr_bit => adr_bit ,duzina => duzina)
				 port map(
						address_sig => brojac, 
						memory_out => rom_izlaz
				 ); 
	
	pom <= std_logic_vector(unsigned(brojac)+1);
	stack: entity work.stack
				 port map(stack_in => stack_in,
							 stack_out => stack_out,
							 address_in => pom,
							 address_out=> izlaz_stack);
	addressa <= izlaz_stack when stack_out='1' else
				  address;
	upis <= stack_in or stack_out or par_upis;
	
	I_R: entity work.I_R
				port map(
					clk => clk,
					data => rom_izlaz,
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
					adresa_in1 => address,
					upis_k => upis_k,
					upis_r => upis_r,
					adr_ram_dir => adr_ram_dir,
					izbor1 => izbor1, 
					konstanta => konstanta,
					ins_kod => ins_kod
				);
	RAM_Rn_Ak:entity work.RAM_Rn_Ak
					generic map(N => 4, M => 8)
					port map(
						clk => clk, 
						upis_k => upis_k,
						upis_r => upis_r,
						adr_ram_dir => adr_ram_dir,	
						izlaz => izlaz,
						akA => akA,
						akB => akB,
						akC => akC,
						akD => akD,
						konstanta => konstanta,
						izbor1 => izbor1
					); 	
	alu: entity work.alu
					port map(
						clk => clk,
						reset => reset,
						akA => akA,
						akB => akB,
						ins_kod => ins_kod,
						akC => akC,
						akD => akD
					);				
end arch;
