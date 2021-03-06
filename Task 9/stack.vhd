library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity stack is
generic( N: integer := 4);
port(
stack_in, stack_out : in std_logic;
address_in: in std_logic_vector(N - 1 downto 0);
address_out: out std_logic_vector(N - 1 downto 0)
);
end stack;
architecture arch of stack is
type mem_type is array (0 to N - 1) of std_logic_vector(N - 1 downto 0);
signal stack_mem : mem_type; -- := (others => (others => '0'));
begin
process(stack_in, stack_out)
begin
if(stack_in = '1') then
for i in 0 to N - 2 loop
stack_mem(i) <= stack_mem(i + 1);
end loop;
stack_mem(N - 1) <= address_in;
elsif(stack_out = '1') then
address_out <= stack_mem(N - 1);
for i in 0 to N - 2 loop
stack_mem(N - 1 - i) <= stack_mem(N - 2 - i);
end loop;
end if;
end process;
end arch;