library ieee;
use ieee.std_logic_1164.all;

entity zad1 is

port(
	SW : in std_logic_vector(17 downto 0);
	LEDG : out std_logic_vector(2 downto 0)
);

end zad1;

architecture arch_lab1_zad1 of zad1 is
begin
	mux5 : entity work.multiplekser_5na1_3bit
		port map (s3(0) => SW(15),s3(1) => SW(16),s3(2) => SW(17), A => SW(2 downto 0), B => SW(5 downto 3),C => SW(8 downto 6),D => SW(11 downto 9),E => SW(14 downto 12), o3 => LEDG);
end arch_lab1_zad1;