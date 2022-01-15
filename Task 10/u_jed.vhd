library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity u_jed is
	generic( N: integer := 4; B: integer := 11);
	port(
		status: in std_logic_vector(3 downto 0);
		instrukcijski_registar: in std_logic_vector(B-1 downto 0);
		stack_in, stack_out, paralelni_upis1: out std_logic;
		adresa_in1: out std_logic_vector(N-1 downto 0);
		upis_k, upis_r : out std_logic;
		adr_ram_dir : out std_logic_vector(N-1 downto 0);
		izbor1: out std_logic_vector(2 downto 0); 
		konstanta: out std_logic_vector(7 downto 0);
		ins_kod : out std_logic_vector(3 DOWNTO 0)
	);
end u_jed;

architecture arch of u_jed is
begin
	
	process(status, instrukcijski_registar)
	begin
		if(instrukcijski_registar(B - 1 downto B - N) = "0000") then
			-- nop
			stack_in <= '0';
			stack_out <= '0';
			paralelni_upis1 <= '0';
			upis_r <= '0';
			upis_k <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0001") then
			-- call
			stack_in <= '1';
			stack_out <= '0';
			paralelni_upis1 <= '0';
			upis_r <= '0';
			upis_k <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0010") then
			-- return
			stack_out <= '1';
			stack_in <= '0';
			paralelni_upis1 <= '0';
			upis_r <= '0';
			upis_k <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0011") then
			-- goto
			stack_out <= '0';
			stack_in <= '0';
			paralelni_upis1 <= '1';
			upis_r <= '0';
			upis_k <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0101" and status(3) = '0') then
			upis_k <= '1';
			stack_in <= '0';
			stack_out <= '0';
			paralelni_upis1 <= '0';
			upis_r <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0100" and status(3) = '0') then
			upis_r <= '1';
			stack_in <= '0';
			stack_out <= '0';
			paralelni_upis1 <= '0';
			upis_k <= '0';
		else
			upis_r <= '0';
			upis_k <= '0';
			stack_in <= '0';
			stack_out <= '0';
			paralelni_upis1 <= '0';
		end if;
	end process;
	adresa_in1 <= instrukcijski_registar(N - 1 downto 0);
	adr_ram_dir <= instrukcijski_registar(N - 1 downto 0) when (instrukcijski_registar(B - 1 downto B - N) = "0100" and
	(instrukcijski_registar(6 downto 4) = "000" or instrukcijski_registar(6 downto 4) = "001" or 
	instrukcijski_registar(6 downto 4) = "010" or instrukcijski_registar(6 downto 4) = "011" or 
	instrukcijski_registar(6 downto 4) = "100"));
	izbor1 <= instrukcijski_registar(6 downto 4);
	konstanta(7) <= '0';
	konstanta(6 downto 0) <= instrukcijski_registar(6 downto 0);
	ins_kod <= instrukcijski_registar(B - 1 downto 7);
end arch;
