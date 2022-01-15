library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programski_brojac is
	generic(N: integer := 4);
	port(
		clk: in std_logic;
		reset: in std_logic;
		upis: in std_logic;
		adr: in std_logic_vector(N-1 downto 0);
		PC: out std_logic_vector(N-1 downto 0)
	);
end programski_brojac;

architecture arch of programski_brojac is
	signal reg_state : unsigned(N-1 downto 0) :=to_unsigned(0,N);
	signal reg_next: unsigned(N-1 downto 0):=to_unsigned(0,N);
begin
	process(clk)
	begin
		if (clk'event and clk='1') then
			if (reset = '1') then
				reg_state <= (others => '0');
			else
				reg_state <= reg_next;
			end if;
		end if;
	end process;
	
	reg_next <= unsigned(adr) when upis = '1' 
									else (reg_state+1);
	
	PC <= std_logic_vector(reg_state);
	
end arch;
