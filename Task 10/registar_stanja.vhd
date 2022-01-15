library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registar_stanja is
	port(
		clk, paralelni_upis : in std_logic;
		status: out std_logic_vector(3 downto 0)
	);
end registar_stanja;

architecture arch of registar_stanja is
begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (paralelni_upis = '1') then
				status(0) <= '0';
				status(1) <= '0';
				status(2) <= '0';
				status(3) <= paralelni_upis;
			else
				status(0) <= '0';
				status(1) <= '0';
				status(2) <= '0';
				status(3) <= '0';
			end if;
		end if;
	end process;

end arch;