library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity RAM_Rn_Ak is
	generic (
		N : integer := 4;
		M : integer := 8);
	port (
		clk, upis_k, upis_r : in std_logic;
		adr_ram_dir : in std_logic_vector(N - 1 downto 0);
		izlaz : out std_logic_vector(M - 1 downto 0);
		akA, akB, akC, akD : out std_logic_vector(M - 1 downto 0);
		konstanta : in std_logic_vector(M - 1 downto 0);
		izbor1 : in std_logic_vector(2 downto 0));
end RAM_Rn_Ak;
architecture arch of RAM_Rn_Ak is
	type mem_array is array (0 to 2 ** N - 1)
	of std_logic_vector(M - 1 downto 0);
	type mem_array1 is array (0 to N - 1)
	of std_logic_vector(M - 1 downto 0);
	signal RAM1 : mem_array;
	signal RAM : mem_array := (others => "00000000");
	signal R : mem_array1;
	signal m1 : integer;
begin
	process (clk)
	begin
	if(clk'event and clk='1') then
		if (upis_k = '1') then
			R(0) <= konstanta;
		elsif (upis_r = '1' and izbor1 = "100") then
			R(0) <= RAM(to_integer(unsigned(adr_ram_dir)));
		end if;
		if (upis_r = '1' and izbor1 = "101") then
			R(1) <= RAM(to_integer(unsigned(R(0)(3 downto 0))));
		elsif (upis_r = '1' and izbor1 = "111") then
			R(1) <= R(0);
		end if;
		if (upis_r = '1' and izbor1 = "010") then
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(2);
		elsif (upis_r = '1' and izbor1 = "000") then
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(0);
		elsif (upis_r = '1' and izbor1 = "001") then
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(1);
		elsif (upis_r = '1' and izbor1 = "110") then
			RAM1(to_integer(unsigned(R(1)(3 downto 0)))) <= R(0);
		elsif (upis_r = '1' and izbor1 = "011") then
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(3);
		end if;
	end if;
	end process; --q <= memory(to_integer(unsigned(address)));
	gen : for i in 0 to 2 ** N - 1 generate
		RAM(i) <= "00000000" when RAM1(i) = "UUUUUUUU" else
		RAM1(i);
	end generate gen;
	akA <= R(0);
	akB <= R(1);
	akC <= R(2);
	akD <= R(3);
end arch;