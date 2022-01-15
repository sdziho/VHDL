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
		status(0) <= '0';
		status(1) <= '0';
		status(2) <= '0';
		status(3) <= paralelni_upis;
end arch;