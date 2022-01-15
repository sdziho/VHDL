library ieee;
use ieee.std_logic_1164.all;

entity lab4_zad3 is
	port(
		clk, reset: in std_logic;
		level: in std_logic;
		tick: out std_logic
	);
end lab4_zad3;

architecture arch of lab4_zad3 is 
	type state_type is (sA, sB,sC,sD,sE,sF,sG,sH,sI);
	signal state_reg, state_next: state_type;
begin
	--state registar
	process(clk, reset)
	begin
		if(reset = '1') then 
			state_reg <= sA;
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
			when sA =>
				if(level = '0') then 
					state_next <= sB;
				else
					state_next <= sF;
				end if;
			when sB =>
				if(level = '0') then 
					state_next <= sC;
				else
					state_next <= sF;
				end if;
			when sF =>
				if(level = '0') then 
					state_next <= sB;
				else
					state_next <= sG;
				end if;
			when sC =>
				if(level = '0') then 
					state_next <= sD;
				else
					state_next <= sF;
				end if;
			when sG =>
				if(level = '0') then 
					state_next <= sB;
				else
					state_next <= sH;
				end if;
			when sD =>
				if(level = '0') then 
					state_next <= sE;
				else
					state_next <= sF;
				end if;
			when sH =>
				if(level = '0') then 
					state_next <= sB;
				else
					state_next <= sI;
				end if;
			when sE =>
				tick <= '1';
				if(level = '1') then 
					state_next <= sF;
				end if;
			when sI =>
				tick <= '1';
				if(level = '0') then 
					state_next <= sB;
				end if;

		end case;
	end process;
end arch;