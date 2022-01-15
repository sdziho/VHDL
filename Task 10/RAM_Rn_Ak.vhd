library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY RAM_Rn_Ak IS
	generic(N: integer := 4; M: integer :=8);
	PORT (clk, upis_k, upis_r: IN STD_LOGIC;
	 adr_ram_dir : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	 izlaz: out STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	 akA, akB: OUT STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	 akC, akD: IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	 konstanta : IN STD_LOGIC_VECTOR(M-1 DOWNTO 0);
	 izbor1: IN STD_LOGIC_VECTOR(2 DOWNTO 0));
END RAM_Rn_Ak; 

architecture arch of RAM_Rn_Ak is
	type niz1 is array (0 to 2 ** N - 1) of std_logic_vector(M - 1 downto 0);
	type niz2 is array (0 to N - 1) of std_logic_vector(M - 1 downto 0);
	signal RAM1: niz1; 
	signal RAM : niz1 := (others => "00000000");
	signal R: niz2;
	signal m1:integer;
begin
	process(clk)
	begin
	if (clk'event and clk = '1') then 
		if(upis_k = '1') then
			--mov k,R0
			R(0) <= konstanta;
		elsif(upis_r = '1' and izbor1 = "100") then
			--mov f,R0
			R(0) <= RAM(to_integer(unsigned(adr_ram_dir)));
		elsif(upis_r = '1' and izbor1 = "101") then
			--mov [R0], R1
			R(1) <= RAM(to_integer(unsigned(R(0)(3 downto 0))));
		elsif(upis_r = '1' and izbor1 = "111") then
			--mov R0,R1
			R(1) <= R(0);
		elsif(upis_r = '1' and izbor1 = "010") then
			--mov R2,f
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(2);
		elsif(upis_r = '1' and izbor1 = "000") then
			--mov R0,f
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(0);
		elsif(upis_r = '1' and izbor1 = "001") then
			--mov R1,f
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(1);
		elsif(upis_r = '1' and izbor1 = "110") then
			--mov [R0],R1
			RAM1(to_integer(unsigned(R(1)(3 downto 0)))) <= R(0);
		elsif(upis_r = '1' and izbor1 = "011") then
			--mov R3,f
			RAM1(to_integer(unsigned(adr_ram_dir))) <= R(3);
		end if;
	end if;
	end process; 
	generisi: for i in 0 to 2 ** N - 1 generate
		RAM(i) <= "00000000" when RAM1(i) = "UUUUUUUU" else RAM1(i);
	end generate generisi;

	akA <= R(0); akB <= R(1); R(2)<= akC; R(3)<= akD;

end arch;