library ieee;
use ieee.std_logic_1164.all;

entity multiplekser_2na1_1bit is

port(
	s1 : in std_logic;
	A1 : in std_logic_vector(1 downto 0);
	o1 :out std_logic
);

end multiplekser_2na1_1bit;

architecture arch_multiplekser_2na1_1bit of multiplekser_2na1_1bit is
begin
	o1 <= A1(0) when (s1 = '0') else A1(1);
end arch_multiplekser_2na1_1bit;