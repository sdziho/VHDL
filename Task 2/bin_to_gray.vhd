library ieee;
use ieee.std_logic_1164.all;

entity bin_to_gray is
	generic(N: integer := 3);
	port(
		ulaz: in std_logic_vector(N-1 downto 0);
		izlaz: out std_logic_vector(N-1 downto 0)
	);
end bin_to_gray;

architecture arch_bin_to_gray of bin_to_gray is
	signal temp, temp1: std_logic_vector(N-1 downto 0);
begin
	temp<= ulaz(N-2 downto 0) & "0";
	temp1<= ulaz xor temp;
	izlaz(N-1)<=ulaz(N-1);
	izlaz(N-2 downto 0)<=temp1(N-1 downto 1);
end arch_bin_to_gray;