
library ieee;
use ieee.std_logic_1164.all;
use ieee. numeric_std.all;

entity rom is
	generic(adr_bit: integer :=4 ;duzina: integer := 11);
	port(
		address_sig: in std_logic_vector(adr_bit-1 downto 0);
		memory_out: out std_logic_vector(duzina-1 downto 0)
	);
end rom;

architecture arch of rom is
	type mem_array is array (0 to 2**adr_bit-1) of std_logic_vector(duzina-1 downto 0);
	constant memory : mem_array := (
											"01011110111",
											"01001110000",
											"01010101110",
											"01100000000",
											"01000100000",
											"01110000000",
											"01000100001",
											"10000000000",
											"01000100010",
											"01011111111",
											"10010000000",
											"01000100011",
											"10100000000",
											"01000100100",
											"01000100101",
											"00110000000"
											);
begin
	memory_out <= memory(to_integer(unsigned(address_sig)));
end arch;
