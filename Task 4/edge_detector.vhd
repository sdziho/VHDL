library ieee;
use ieee.std_logic_1164.all;

entity edge_detector is
	port(
		clk, reset: in std_logic;
		level: in std_logic;
		tick: out std_logic
	);
end edge_detector;

architecture edge_detector_arch of edge_detector is 
	type state_type is (zero, edge1, one,edge2);
	signal state_reg, state_next: state_type;
begin
	--state registar
	process(clk, reset)
	begin
		if(reset = '1') then 
			state_reg <= zero;
		elsif(clk'event and clk = '1') then 
			state_reg <= state_next;
		end if;
	end process;
	
	--next state/output logic
	process(state_reg, level)
	begin
		--set default values for state_next and output(s)
		state_next <= state_reg;
		tick <= '0';
		case state_reg is
			when zero =>
				if(level = '1') then 
					state_next <= edge1;
				end if;
			when edge1 =>
				tick <= '1';
				if(level = '1') then 
					state_next <= one;
				else
					state_next <= edge2;
				end if;
			when one => 
				if(level = '0') then
					state_next <= edge2;
				end if;
			when edge2 => 
				tick <= '1';
				if(level = '1') then 
					state_next <= edge1;
				else
					state_next <= zero;
				end if;
		end case;
	end process;
end edge_detector_arch;