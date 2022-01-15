library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lv5_zad2 is
	port(
		clk: in std_logic;
		senzor1: in std_logic;
		senzor2: in std_logic;
		naprijed: out std_logic;
		nazad: out std_logic;
		cnt: out integer
	);
end lv5_zad2;

architecture arch of lv5_zad2 is 
	type state_type is (s0,s1,s2,s3,s4,s5,s6,gore,dole);
	signal state_reg, state_next: state_type;
	signal rezultat : std_logic_vector(1 downto 0);
	signal nap, naz : std_logic;
	signal pocetna : integer := 50;
	
begin
	process(clk)
	begin
		if(clk'event and clk = '1') then 
			state_reg <= state_next;
		end if;
	end process;
	
	process(state_reg, senzor1,senzor2)
	begin
		naprijed <= '0';
		nazad <= '0';
		nap <= '0';
		naz <= '0';
		state_next <= state_reg;
		rezultat <= senzor1 & senzor2;
		
		
		case state_reg is
			when s0 =>
				if(rezultat = "10") then 
					state_next <= s1;
			   elsif(rezultat = "01") then
					state_next <= s4;
				end if;
			when s1 =>
				if(rezultat = "11") then 
					state_next <= s2;
				end if;
			when s2 => 
				if(rezultat = "01") then
					state_next <= s3;
				end if;
			when s3 => 
				if(rezultat = "00") then 
					state_next <= dole;
					nazad <= '1';
					naz <= '1';
				end if;
			when dole => 
					state_next <= s0;
			when s4 =>
				if(rezultat = "11") then 
					state_next <= s5;
				end if;
			when s5 => 
				if(rezultat = "10") then
					state_next <= s6;
				end if;
			when s6 => 
				if(rezultat = "00") then 
					state_next <= gore;
					naprijed <= '1';
					nap <= '1';
				end if;
			when gore => 
					state_next <= s0;
		end case;
	end process;

	
	process(nap,naz)
	begin
		if(nap='1') then 
			pocetna <= pocetna+1;
			cnt <= pocetna;
		elsif(naz='1') then
			pocetna <= pocetna-1;
			cnt <= pocetna;
		else
			cnt <= pocetna;
		end if;
	end process;
	

end arch;