library ieee;
use ieee.std_logic_1164.all;

entity lab2_zad2 is
	port(
		SW1: in std_logic_vector(3 downto 0);
		SW2: in std_logic_vector(7 downto 0);
		LED1: out std_logic_vector(3 downto 0);
		LED2: out std_logic_vector(7 downto 0)
	);
end lab2_zad2;

architecture arch_lab2_zad2 of lab2_zad2 is
begin
	test1: entity work.bin_to_gray
			generic map(N => 4)
			port map(ulaz => SW1, izlaz=>LED1);
			
	test2: entity work.bin_to_gray
			generic map(N => 8)
			port map(ulaz => SW2, izlaz=>LED2);			

end arch_lab2_zad2;