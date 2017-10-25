----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer:  Kishore Muthukulathu Devasia 
-- 
-- Create Date:    01:51:07 06/08/2017 
-- Design Name: 
-- Module Name:    MUX_16to1_16Bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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

entity MUX_16to1_16Bits is
    Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           in8 : in  STD_LOGIC_VECTOR (15 downto 0);
           in9 : in  STD_LOGIC_VECTOR (15 downto 0);
           in10 : in  STD_LOGIC_VECTOR (15 downto 0);
           in11 : in  STD_LOGIC_VECTOR (15 downto 0);
           in12 : in  STD_LOGIC_VECTOR (15 downto 0);
           in13 : in  STD_LOGIC_VECTOR (15 downto 0);
           in14 : in  STD_LOGIC_VECTOR (15 downto 0);
           in15 : in  STD_LOGIC_VECTOR (15 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0));
end MUX_16to1_16Bits;

architecture Behavioral of MUX_16to1_16Bits is
begin
	process (in0, in1, in2, in3, in4, in5, in6, in7,
				in8, in9, in10, in11, in12, in13, in14, in15, sel)
		begin
			case sel is
				when "0000" => outp <= in0;
				when "0001" => outp <= in1;
				when "0010" => outp <= in2;
				when "0011"	=> outp <= in3;
				when "0100" => outp <= in4;
				when "0101" => outp <= in5;
				when "0110" => outp <= in6;
				when "0111" => outp <= in7;
				when "1000" => outp <= in8;
				when "1001" => outp <= in9;
				when "1010" => outp <= in10;
				when "1011" => outp <= in11;
				when "1100" => outp <= in12;
				when "1101" => outp <= in13;
				when "1110" => outp <= in14;
				when others => outp <= in15;
			end case;
	end process;

end Behavioral;

