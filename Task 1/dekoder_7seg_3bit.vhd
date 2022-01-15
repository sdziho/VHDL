library ieee;
use ieee.std_logic_1164.all;

entity dekoder_7seg_3bit is

port(
	c : in std_logic_vector(2 downto 0);
	d : out std_logic_vector(6 downto 0)
);

end dekoder_7seg_3bit;

architecture arch_dekoder_7seg_3bit of dekoder_7seg_3bit is
begin

--with c select
--    d <= "1000000" when "000",
--         "1111001" when "001",
--         "0100100" when "010",
--         "0110000" when "011",
--			"0011011" when "100",
--			"0010010" when "101",
--			"0000010" when "111",
--			"1111000" when others;

	d(6) <= (not c(2) and not c(1) and not c(0)) or (not c(2) and not c(1) and c(0)) or (c(2) and c(1) and c(0));
	d(5) <= (not c(2) and not c(1) and c(0)) or (not c(2) and c(1) and not c(0)) or (not c(2) and c(1) and c(0)) or (c(2) and c(1) and c(0));
	d(4) <= (not c(2) and not c(1) and c(0)) or (not c(2) and c(1) and c(0)) or (c(2) and not c(1) and not c(0)) or (c(2) and not c(1) and c(0)) or (c(2) and  c(1) and c(0));
	d(3) <= (not c(2) and not c(1) and c(0)) or (c(2) and not c(1) and not c(0)) or (c(2) and c(1) and c(0));
	d(2) <= (not c(2) and c(1) and not c(0));
	d(1) <= (c(2) and not c(1) and not c(0)) or (c(2) and not c(1) and c(0)) or (c(2) and c(1) and not c(0));
	d(0) <= (not c(2) and not c(1) and c(0)) or (c(2) and not c(1) and not c(0));
end arch_dekoder_7seg_3bit;