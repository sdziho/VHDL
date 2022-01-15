library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lab5_zad1 is
	port(
			SW: in std_logic_vector(8 downto 0);
			start: in std_logic;
			reset: in std_logic;
			clk: in std_logic;
			HEX0: out std_logic_vector(6 downto 0);
			cnt: out integer
			
	);
end lab5_zad1;

architecture arch of lab5_zad1 is 
	type state_type is (S1,S2,S3);
	signal state_reg, state_next: state_type;
	signal temp,temp_old: unsigned(8 downto 0);
	signal counter: integer:=0;
	constant nula: std_logic_vector(6 downto 0) := "1000000";
	constant jedan: std_logic_vector(6 downto 0) := "1111001";
	constant dva: std_logic_vector(6 downto 0) := "0100100";
	constant tri: std_logic_vector(6 downto 0) := "0110000";
	constant cetiri: std_logic_vector(6 downto 0) := "0011011";
	constant pet: std_logic_vector(6 downto 0) := "0010010";
	constant sest: std_logic_vector(6 downto 0) := "0000010";
	constant sedam: std_logic_vector(6 downto 0) := "1111000";
	constant osam: std_logic_vector(6 downto 0) := "0000000";
	constant devet: std_logic_vector(6 downto 0) := "0010000";
begin

	process(clk,reset)
	begin
		if(reset='1') then
			state_reg<=S1;
			temp_old<=unsigned(SW);
		elsif (clk 'event and clk='1') then
			state_reg<=state_next;
			temp_old<=temp;
		end if;
	end process;
	
	process(start,temp_old,state_next,state_reg)
	begin
		state_next<=state_reg;
		temp<=temp_old;
		case state_reg is
			when S1 =>
				counter<=0;
				
				if(start='1') then
					state_next<=S2;
					
				end if;
			
			when S2 =>
				if(temp(0)='1') then
					counter<=counter+1;
				end if;
				temp<='0' & temp_old(8 downto 1);
				if(temp=0) then
					state_next<=S3;
				end if;
			when S3 =>
				state_next<=S1;
				
			
		end case;
				
	end process;
	cnt<=counter;
	with counter select
		HEX0 <= nula when 0,
			jedan when 1,
			dva when 2,
			tri when 3,
			cetiri when 4,
			pet when 5,
			sest when 6,
			sedam when 7,
			osam when 8,
			devet when others;
			
	
	
end arch;