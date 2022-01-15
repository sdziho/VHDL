library ieee;
use ieee.std_logic_1164.all;

entity multiplekser_5na1_1bit is

port(
	s2 : in std_logic_vector(2 downto 0);
	A2 : in std_logic_vector(4 downto 0);
	o2 : out std_logic
);

end multiplekser_5na1_1bit;

architecture arch_multiplekser_5na1_1bit of multiplekser_5na1_1bit is
	signal temp1, temp2, temp3 : std_logic;
begin
	--instantacija četiri 1-bitna 2 na 1 muxa
	mux1 : entity work.multiplekser_2na1_1bit
		port map (s1 => s2(0), A1(0) => A2(0), A1(1) => A2(1), o1 => temp1);
	mux2 : entity work.multiplekser_2na1_1bit
		port map (s1 => s2(0), A1(0) => A2(2), A1(1) => A2(3), o1 => temp2);
	mux3 : entity work.multiplekser_2na1_1bit
		port map (s1 => s2(1), A1(0) => temp1, A1(1) => temp2, o1 => temp3);
	mux4 : entity work.multiplekser_2na1_1bit
		port map (s1 => s2(2), A1(0) => temp3, A1(1) => A2(4), o1 => o2);		
end arch_multiplekser_5na1_1bit;