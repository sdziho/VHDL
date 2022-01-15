library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity univerzalni_brojac is
	generic (N : integer := 7);
	port(
		clk,reset: in std_logic;
		up,down: in std_logic;
		q: out integer
	);
end univerzalni_brojac;

architecture arch of univerzalni_brojac is
	signal r_reg: integer;
	signal r_next: integer;
	signal ctrl : std_logic_vector(1 downto 0);
begin
	-- register
	process(clk,reset)
	begin
		if(reset = '1') then
			r_reg <= N;
		elsif (clk'event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;
	
	-- next-state logic
	ctrl <= up & down;
	r_next<= 
				r_reg+1 when (ctrl = "10") else
				r_reg-1 when (ctrl = "01") else
				r_reg;
				
	-- output
	q <= r_reg;
end arch;