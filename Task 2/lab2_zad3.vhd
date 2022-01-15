library ieee;
use ieee.std_logic_1164.all;

entity lab2_zad3 is
	port(
		SW: in std_logic_vector(3 downto 0);
		DES: out std_logic_vector(6 downto 0);
		JED: out std_logic_vector(6 downto 0)
	);
end lab2_zad3;

architecture arch_lab2_zad3 of lab2_zad3 is
begin
		temp : entity work.binary_to_decimal
				port map(ulaz => SW, jedinice => JED, desetice => DES);

end arch_lab2_zad3;