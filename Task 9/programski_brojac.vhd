library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity programski_brojac is
generic(N: integer := 4);
port(
clk, reset, load: in std_logic;
load_in: in unsigned(N - 1 downto 0);
q: out std_logic_vector(N - 1 downto 0));
end programski_brojac;
architecture arch of programski_brojac is
signal r_reg, r_next: unsigned(N - 1 downto 0);
begin
process(clk, reset, load, load_in)
begin
if (clk ' event and clk = '1') then
r_reg <= r_next;
end if;
end process;
process(clk, reset, load)
begin
r_next <= r_reg + 1;
if (load = '1') then
r_next <= load_in;
end if;
if(reset = '1') then
r_next <= "0000";
end if;
end process;
q <= std_logic_vector(r_reg);
end arch;