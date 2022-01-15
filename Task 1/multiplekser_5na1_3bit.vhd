library ieee;
use ieee.std_logic_1164.all;

entity multiplekser_5na1_3bit is

port(
	s3 : in std_logic_vector(2 downto 0);
	A : in std_logic_vector(2 downto 0);
	B : in std_logic_vector(2 downto 0);
	C : in std_logic_vector(2 downto 0);
	D : in std_logic_vector(2 downto 0);
	E : in std_logic_vector(2 downto 0);
	o3 : out std_logic_vector(2 downto 0)
);

end multiplekser_5na1_3bit;

architecture arch_multiplekser_5na1_3bit of multiplekser_5na1_3bit is
begin
	--instantacija četiri 1-bitna 2 na 1 muxa
	mux1 : entity work.multiplekser_5na1_1bit
		port map (s2 => s3, A2(0) => A(0), A2(1) => B(0), A2(2) => C(0), A2(3) => D(0), A2(4) => E(0), o2 => o3(0));
	mux2 : entity work.multiplekser_5na1_1bit
		port map (s2 => s3, A2(0) => A(1), A2(1) => B(1), A2(2) => C(1), A2(3) => D(1), A2(4) => E(1), o2 => o3(1));
	mux3 : entity work.multiplekser_5na1_1bit
		port map (s2 => s3, A2(0) => A(2), A2(1) => B(2), A2(2) => C(2), A2(3) => D(2), A2(4) => E(2), o2 => o3(2));
	
end arch_multiplekser_5na1_3bit;