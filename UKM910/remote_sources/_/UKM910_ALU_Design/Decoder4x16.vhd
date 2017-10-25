----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    20:41:38 06/05/2017 
-- Design Name: 	 UKM910 ALU Design
-- Module Name:    Decoder4x16 - Behavioral 
-- Project Name: 	 UKM910
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- This decoder is used to decode the ALU functions
-- Output bit format is
-- 0000 0000 0 Asel Bsel Ainv Binv Cin [funcsel]
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder4x16 is
    Port ( inp : in  STD_LOGIC_VECTOR (3 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0));
end Decoder4x16;

architecture Behavioral of Decoder4x16 is

	-- 0000 0000 0 Asel Bsel Ainv Binv Cin [funcsel]

	constant NOP 	: std_logic_vector (15 downto 0) := "0000000000000000";
	constant AADDB	: std_logic_vector (15 downto 0) := "0000000001100011";
	constant ASUBB	: std_logic_vector (15 downto 0) := "0000000001101111";
	constant BSUBA	: std_logic_vector (15 downto 0) := "0000000001110111";
	constant SELA	: std_logic_vector (15 downto 0) := "0000000001000011";
	constant SELB	: std_logic_vector (15 downto 0) := "0000000000100011";
	constant INCA	: std_logic_vector (15 downto 0) := "0000000001000111";
	constant INCB	: std_logic_vector (15 downto 0) := "0000000000100111";
	constant AANDB	: std_logic_vector (15 downto 0) := "0000000001100000";
	constant AORB	: std_logic_vector (15 downto 0) := "0000000001100001";
	constant AXORB	: std_logic_vector (15 downto 0) := "0000000001100010";
	constant NOTA	: std_logic_vector (15 downto 0) := "0000000001010011";
	constant NOTB	: std_logic_vector (15 downto 0) := "0000000000101011";
	constant COMPA	: std_logic_vector (15 downto 0) := "0000000001010111";
	constant COMPB	: std_logic_vector (15 downto 0) := "0000000000101111";
begin

	process (inp)
		begin
			case inp is
				when "0000" => outp <= NOP;
				when "0001" => outp <= AADDB;
				when "0010" => outp <= ASUBB;
				when "0011" => outp <= BSUBA;
				when "0100" => outp <= SELA;
				when "0101" => outp <= SELB;
				when "0110" => outp <= INCA;
				when "0111" => outp <= INCB;
				when "1000" => outp <= AANDB;
				when "1001" => outp <= AORB;
				when "1010" => outp <= AXORB;
				when "1100" => outp <= NOTA;
				when "1101" => outp <= NOTB;
				when "1110" => outp <= COMPA;
				when "1111" => outp <= COMPB;
				when others => outp <= NOP;
			end case;
	end process;

end Behavioral;

