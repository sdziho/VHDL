library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programski_brojac is
	generic(N: integer := 4);
	port(
		clk,reset,par_upis: in std_logic;
		address: in std_logic_vector(N-1 downto 0);
		PC: out std_logic_vector(N-1 downto 0)
	);
end programski_brojac;

architecture arch of programski_brojac is
	signal r_reg : unsigned(N-1 downto 0) := to_unsigned(0,N);
	signal r_next: unsigned(N-1 downto 0) := to_unsigned(0,N);
begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if (reset = '1') then
				r_reg <= (others => '0');
			else
				r_reg <= r_next;
			end if;
		end if;
	end process;
	r_next <= unsigned(address) when par_upis = '1' else (r_reg+1);
	PC <= std_logic_vector(r_reg);
	
end arch;
