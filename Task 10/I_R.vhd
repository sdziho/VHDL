library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity I_R is
	generic( B: integer := 11);
	port( clk: in std_logic;
		data: in std_logic_vector(B-1 downto 0);
		instrukcijski_registar: out std_logic_vector(B-1 downto 0)
	);
end I_R;

architecture arch of I_R is
begin
	process(clk)
		begin
		if (clk ' event and clk = '1') then
			instrukcijski_registar <= data;
		end if;
	end process;
end arch;