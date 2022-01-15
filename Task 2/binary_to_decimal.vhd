library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_to_decimal is
	port(
		ulaz : in std_logic_vector(3 downto 0);
		jedinice : out std_logic_vector(6 downto 0);
		desetice : out std_logic_vector(6 downto 0)
	);
end binary_to_decimal;

architecture arch_binary_to_decimal of binary_to_decimal is
		constant devet: unsigned(3 downto 0) := "1001";
		constant deset: unsigned(3 downto 0) := "1010";
		signal z: integer;
		signal A: unsigned(3 downto 0);
		signal jed: std_logic_vector(3 downto 0);
		signal des : std_logic_vector(3 downto 0);
		signal temp1, temp2 :std_logic_vector(13 downto 0);
begin
		z <= 1 when unsigned(ulaz) > devet else 0;
		A <= unsigned(ulaz)-deset when z=1 else unsigned(ulaz);
		des <= "0001" when z=1 else "0000";
		jed <= std_logic_vector(A);
		
		izl1 : entity work.dekoder_7seg_4bit
				port map(ulaz4bit => jed, izlaz14bit => temp1);
		izl2 : entity work.dekoder_7seg_4bit
				port map(ulaz4bit => des, izlaz14bit => temp2);
		desetice <= temp2(6 downto 0);
		jedinice <= temp1(6 downto 0);
		

end arch_binary_to_decimal;