library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity u_jed is
	generic( N: integer := 4; B: integer := 11);
	port(
		status: in std_logic_vector(3 downto 0);
		instrukcijski_registar: in std_logic_vector(B-1 downto 0);
		stack_in, stack_out, paralelni_upis1: out std_logic;
		adresa_in1: out std_logic_vector(N-1 downto 0)
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
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0001") then
			-- call
			stack_in <= '1';
			stack_out <= '0';
			paralelni_upis1 <= '0';
			adresa_in1 <= instrukcijski_registar(N - 1 downto 0);
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0010") then
			-- return
			stack_out <= '1';
			stack_in <= '0';
			paralelni_upis1 <= '0';
		elsif(instrukcijski_registar(B - 1 downto B - N) = "0011") then
			-- goto
			stack_out <= '0';
			stack_in <= '0';
			paralelni_upis1 <= '1';
			adresa_in1 <= instrukcijski_registar(N - 1 downto 0);
		else
			stack_in <= '0';
			stack_out <= '0';
			paralelni_upis1 <= '0';
		end if;
	end process;
end arch;