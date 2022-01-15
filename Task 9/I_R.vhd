library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity I_R is
generic( B: integer := 11);
port( clk: in std_logic;
data:in std_logic_vector(B-1 downto 0);
instrukcijski_registar: out std_logic_vector(B-1 downto 0)
);
end I_R;
architecture arch of I_R is
signal count: integer := 0;
begin
process(clk)
begin
if (clk ' event and clk = '1') then
instrukcijski_registar <= data;
end if;
end process;
end arch;