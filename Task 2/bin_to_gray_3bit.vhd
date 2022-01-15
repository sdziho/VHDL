library ieee;
use ieee.std_logic_1164.all;

entity bin_to_gray_3bit is 
	port(
		ulaz: in std_logic_vector(2 downto 0);
		izlaz: out std_logic_vector(2 downto 0)
	);
end bin_to_gray_3bit;

architecture arch_bin_to_gray_3bit of bin_to_gray_3bit is
begin
	izlaz(2)<= ulaz(2);
	izlaz(1)<= ulaz(2) xor ulaz(1);
	izlaz(0)<= ulaz(1) xor ulaz(0);

end arch_bin_to_gray_3bit;