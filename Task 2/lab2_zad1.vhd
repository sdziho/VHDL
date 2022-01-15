library ieee;
use ieee.std_logic_1164.all;

entity lab2_zad1 is
	port (
		SW : in std_logic_vector(3 downto 0);
		HEX5 : out std_logic_vector(6 downto 0);
		HEX7 : out std_logic_vector(6 downto 0)
	);
end lab2_zad1;

architecture arch_lab2_zad1 of lab2_zad1 is
begin
	dek7_na_4 : entity work.dekoder_7seg_4bit(arch_dekoder_7seg_4bit)
				port map(ulaz4bit => SW, izlaz14bit(13 downto 7) => HEX7, izlaz14bit(6 downto 0) => HEX5);

end arch_lab2_zad1;