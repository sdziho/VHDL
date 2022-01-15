library ieee;
use ieee.std_logic_1164.all;

entity zad2 is

port(
	SW : in std_logic_vector(16 downto 0);
	HEX5 : out std_logic_vector(6 downto 0);
	HEX7 : out std_logic_vector(6 downto 0)
);

end zad2;

architecture arch_zad2 of zad2 is
begin
	dekoder1 : entity work.dekoder_7seg_3bit
		port map (c => SW(16 downto 14), d => HEX7);
	dekoder2 : entity work.dekoder_7seg_3bit
		port map (c => SW(12 downto 10), d => HEX5);		
end arch_zad2;