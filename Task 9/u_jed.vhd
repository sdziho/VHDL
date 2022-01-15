library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity u_jed is
generic( N: integer := 4;
B: integer := 11);
port(
status: in std_logic_vector(3 downto 0);
instrukcijski_registar: in std_logic_vector(B-1 downto 0);
stack_in, stack_out, paralelni_upis1, upis_k, upis_r: out std_logic;
adresa_in1: out std_logic_vector(N-1 downto 0);
adr_ram_dir : out STD_LOGIC_VECTOR(N-1 DOWNTO 0);
izbor1: out STD_LOGIC_VECTOR(2 DOWNTO 0);
konstanta: out STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end u_jed;
architecture arch of u_jed is
begin
stack_in <= '1' when (instrukcijski_registar(B - 1 downto B - N) = "0001" and status(3) = '0') else
'0';
stack_out <= '1' when (instrukcijski_registar(B - 1 downto B - N) = "0010" and status(3) = '0') else
'0';
paralelni_upis1 <= '1' when (instrukcijski_registar(B - 1 downto B - N) =
"0011" and status(3) = '0') else
'0';
adresa_in1 <= instrukcijski_registar(N - 1 downto 0);
upis_k <= '1' when (instrukcijski_registar(B - 1 downto B - N) = "0101" and
status(3) = '0') else
'0';
upis_r <= '1' when (instrukcijski_registar(B - 1 downto B - N) = "0100" and
status(3) = '0') else
'0';
adr_ram_dir <= instrukcijski_registar(N - 1 downto 0) when
(instrukcijski_registar(B - 1 downto B - N) = "0100" and
(instrukcijski_registar(6 downto 4) = "000" or instrukcijski_registar(6 downto
4) = "001" or instrukcijski_registar(6 downto 4) = "010" or
instrukcijski_registar(6 downto 4) = "011" or instrukcijski_registar(6 downto 4) = "100"));
izbor1 <= instrukcijski_registar(6 downto 4);
konstanta(7) <= '0';
konstanta(6 downto 0) <= instrukcijski_registar(6 downto 0);
end arch;
