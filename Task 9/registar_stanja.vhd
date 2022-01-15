library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity registar_stanja is
port(
clk, paralelni_upis : in std_logic;
status: out std_logic_vector(3 downto 0)
);
end registar_stanja;
architecture arch of registar_stanja is
begin
process(clk)
begin
if(rising_edge(clk)) then
status(0) <= '0';
status(1) <= '0';
status(2) <= '0';
status(3) <= paralelni_upis;
end if;
end process;
end arch;