library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parking is
	port(
		reset: in std_logic;
		clk: in std_logic;
		senz1: in std_logic;
		senz2: in std_logic;
		naprijed: out std_logic;
		nazad: out std_logic
	);
end parking;

architecture arch_parking of parking is 
	type state_type is (s0,s1,s2,s3,s4,s5,s6,snap,snaz);
	signal state_reg, state_next: state_type;
	signal senzori : std_logic_vector(1 downto 0);
	
begin
	--state registar
	process(clk,reset)
	begin
		if(reset = '1') then
			state_reg <= s0;
		elsif(clk'event and clk = '1') then 
			state_reg <= state_next;
		end if;
	end process;
	
	--next state/output logic
	process(state_reg, senz1,senz2)
	begin
		--set default values for state_next and output(s)
		state_next <= state_reg;
		senzori <= senz1 & senz2;
		naprijed <= '0';
		nazad <= '0';

		
		case state_reg is
			when s0 =>
				if(senzori = "10") then 
					state_next <= s1;
			   elsif(senzori = "01") then
					state_next <= s4;
				end if;
			when s1 =>
				if(senzori = "11") then 
					state_next <= s2;
				end if;
			when s2 => 
				if(senzori = "01") then
					state_next <= s3;
				end if;
			when s3 => 
				if(senzori = "00") then 
					state_next <= snaz;
					nazad <= '1';
				end if;
			when snaz => 
					state_next <= s0;
		----------------------------
			when s4 =>
				if(senzori = "11") then 
					state_next <= s5;
				end if;
			when s5 => 
				if(senzori = "10") then
					state_next <= s6;
				end if;
			when s6 => 
				if(senzori = "00") then 
					state_next <= snap;
					naprijed <= '1';
				end if;
			when snap => 
					state_next <= s0;
		end case;
	end process;
end arch_parking;