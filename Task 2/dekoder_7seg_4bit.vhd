library ieee;
use ieee.std_logic_1164.all;

entity dekoder_7seg_4bit is
	port(
		ulaz4bit : in std_logic_vector(3 downto 0);
		izlaz14bit: out std_logic_vector(13 downto 0)
	);
end dekoder_7seg_4bit;

architecture arch_dekoder_7seg_4bit of dekoder_7seg_4bit is
	constant nula: std_logic_vector(6 downto 0) := "1000000";
	constant jedan: std_logic_vector(6 downto 0) := "1111001";
	constant dva: std_logic_vector(6 downto 0) := "0100100";
	constant tri: std_logic_vector(6 downto 0) := "0110000";
	constant cetiri: std_logic_vector(6 downto 0) := "0011011";
	constant pet: std_logic_vector(6 downto 0) := "0010010";
	constant sest: std_logic_vector(6 downto 0) := "0000010";
	constant sedam: std_logic_vector(6 downto 0) := "1111000";
	constant osam: std_logic_vector(6 downto 0) := "0000000";
	constant devet: std_logic_vector(6 downto 0) := "0010000";
begin
	with ulaz4bit select
		izlaz14bit <= nula & nula when "0000",
						  nula & jedan when "0001",
						  nula & dva when "0010",
						  nula & tri when "0011",
						  nula & cetiri when "0100",
						  nula & pet when "0101",
						  nula & sest when "0110",
						  nula & sedam when "0111",
						  nula & osam when "1000",
						  nula & devet when "1001",
						  jedan & nula when "1010",
						  jedan & jedan when "1011",
						  jedan & dva when "1100",
						  jedan & tri when "1101",
						  jedan & cetiri when "1110",
						  jedan & pet when others; -- "1111"
						  
end arch_dekoder_7seg_4bit;