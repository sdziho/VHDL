library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity moj_procesor is
	generic (
		N : integer := 4;
		M : integer := 11);
	port (
		clk, reset : in std_logic;
		akA, akB, akC, akD : out std_logic_vector(7 downto 0)
	);
end moj_procesor;
architecture arch of moj_procesor is
	signal brojac, h1, q123, temp : std_logic_vector(N - 1 downto 0);
	signal l1 : unsigned(N - 1 downto 0);
	signal load_in1 : unsigned(N - 1 downto 0);
	signal load1 : std_logic := '0';
	signal status : std_logic_vector(3 downto 0);
	signal q1, inst_registar, q2 : std_logic_vector(M - 1 downto 0);
	signal stack_in, stack_out, load11 : std_logic;
	signal upis_k, upis_r : std_logic;
	signal adr_ram_dir : std_logic_vector(N - 1 downto 0);
	signal izbor1 : std_logic_vector(2 downto 0);
	signal konstanta : std_logic_vector(7 downto 0);
	signal izlaz : std_logic_vector(7 downto 0);
begin
	prog_counter_unit1 : entity work.programski_brojac
		generic map(N => N)
		port map(clk => clk, reset => reset, load => load1, load_in => l1, q => brojac);
		
	memorija_inst : entity work.mem_lab7
		generic map(N => N, M => M)
		port map(address => brojac, q => q2);
		
	q1 <= q2 when (reset = '0') else
		"UUUUUUUUUUU";
		
	I_R_inst : entity work.I_R
		port map(clk => clk, data => q1, instrukcijski_registar => inst_registar);
		
	q123 <= std_logic_vector(unsigned(brojac) + 1);
	
	stack_inst : entity work.stack
		port map(stack_in => stack_in, stack_out => stack_out, address_in => q123, address_out => h1);
		
	reg_stanja_inst : entity work.registar_stanja
		port map(clk => clk, paralelni_upis => load1, status => status);
		
	RAM_inst : entity work.RAM_Rn_Ak
		port map(clk => clk, upis_k => upis_k, upis_r => upis_r, adr_ram_dir => adr_ram_dir, izlaz => izlaz, akA => akA, akB => akB, akC => akC, akD => akD, konstanta => konstanta, izbor1 => izbor1);
	
	u_jed_inst : entity work.u_jed
		port map(status => status, instrukcijski_registar => inst_registar, stack_in => stack_in, stack_out => stack_out, paralelni_upis1 => load11, upis_k => upis_k, upis_r => upis_r, adresa_in1 => temp, adr_ram_dir => adr_ram_dir, izbor1 => izbor1, konstanta => konstanta);
	l1 <= unsigned(h1) when stack_out = '1' else
		unsigned(temp);
	load1 <= stack_in or stack_out or load11;
end arch;