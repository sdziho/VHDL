library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mem_lab7 is
generic( N: integer := 4;
M: integer := 11);
port(
address: in std_logic_vector(N - 1 downto 0);
q: out std_logic_vector(M - 1 downto 0)
);
end mem_lab7;
architecture arch of mem_lab7 is
type mem_array is array (0 to 2 ** N - 1)
of std_logic_vector(M - 1 downto 0);
CONSTANT memory: mem_array := ( 
"01011110111", 
"01001110000", 
"01000000000", 
"01000010001", 
"00010001011", 
"01001010000", 
"01001001001", 
"00010001101", 
"01001100000", 
"00000000000", 
"00110000000", 
"01011001001", 
"00100000000", 
"00000000000", 
"00000000000", 
"00100000000"
);
begin
q <= memory(to_integer(unsigned(address)));
end arch;