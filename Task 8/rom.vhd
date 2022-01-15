library ieee;
use ieee.std_logic_1164.all;
use ieee. numeric_std.all;

entity rom is
	generic(linija: integer :=4 ;
			vel: integer := 11);
	port(
		adresa: in std_logic_vector(linija-1 downto 0);
		izlaz: out std_logic_vector(vel-1 downto 0)
	);
end rom;

architecture arch of rom is
	type mem_array is array (0 to 2**linija-1) of std_logic_vector(vel-1 downto 0);
	constant memory : mem_array := (
											"00000000000",
											"00010001000",
											"00000000010",
											"00000000011",
											"00010001010",
											"00000000101",
											"00110000000",
											"01000000111",
											"00000001000",
											"00100001001",
											"00000001010",
											"00000001011",
											"00100001100",
											"00000001101",
											"01000001110",
											"01000001111"
											);
begin
	izlaz <= memory(to_integer(unsigned(adresa)));
end arch;

