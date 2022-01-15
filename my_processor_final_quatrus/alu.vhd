LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
------------------------------------------------------------------
ENTITY alu IS
		PORT (clk, reset: in STD_LOGIC;
		akA,akB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		ins_kod : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		akC,akD : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END alu;
------------------------------------------------------------------
ARCHITECTURE alu_arch OF alu IS
SIGNAL akCa,akDa, inc_a, dec_a, saberi, oduzmi, logicko_i, logicko_ili, rotiraj_ulijevo : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal pomnozi: STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
		-- Aritmeticka jedinica ------------------------------------------
		inc_a <= STD_LOGIC_VECTOR(SIGNED(akA) + 1);
		dec_a <= STD_LOGIC_VECTOR(SIGNED(akA) - 1);
		saberi <= STD_LOGIC_VECTOR(SIGNED(akA) + SIGNED(akB));
		oduzmi <= STD_LOGIC_VECTOR(SIGNED(akA) - SIGNED(akB));
		pomnozi <= STD_LOGIC_VECTOR(SIGNED(akA) * SIGNED(akB));
		logicko_i <= akA and akB;
		logicko_ili <= akA or akB;
		rotiraj_ulijevo <= (7 => akA(6), 6 => akA(5),5 => akA(4),4 => akA(3),3 => akA(2),2 => akA(1), 1 => akA(0),0 => '0');
		WITH ins_kod SELECT
					akCa <= saberi WHEN "0110",
					oduzmi WHEN "0111",
					inc_a WHEN "1000",
					dec_a WHEN "1001",
					pomnozi(7 downto 0) WHEN "1010",
					logicko_i WHEN "1011",
					logicko_ili WHEN "1100",
					rotiraj_ulijevo WHEN "1101",
					akCa WHEN OTHERS;
		WITH ins_kod SELECT
					akDa <= pomnozi(15 downto 8) when "1010",
					akDa WHEN OTHERS;
		process(reset, clk)
			begin
				if (reset = '1') then
					akC<="00000000";
					akD<="00000000";
				elsif (clk'event and clk='1') then
					akC<=akCa;
					akD<=akDa;
				end if;
		end process;
END alu_arch;