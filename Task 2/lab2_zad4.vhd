library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab2_zad4 is
    port(
        a,b  : in  std_logic_vector(3 downto 0); -- input numbers.
        s1 : out  std_logic_vector(3 downto 0); 
		  s0 : out  std_logic_vector(3 downto 0)
    );
end lab2_zad4;

architecture arch of lab2_zad4 is
	signal sum : std_logic_vector(4 downto 0);
begin
	sum <= ('0' & a) + b;
	s0 <= sum(3 downto 0);
	s1 <= "000" & sum(4);
end arch;