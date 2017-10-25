----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia 
-- 
-- Create Date:    13:06:56 06/09/2017 
-- Design Name: 
-- Module Name:    MUX_8to1_16Bits - Behavioral 
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

entity MUX_8to1_16Bits is
	Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0));
end MUX_8to1_16Bits;

architecture Behavioral of MUX_8to1_16Bits is

begin
	process (in0, in1, in2, in3, in4, in5, in6, in7, sel)
		begin
			case sel is
				when "000" => outp <= in0;
				when "001" => outp <= in1;
				when "010" => outp <= in2;
				when "011" => outp <= in3;
				when "100" => outp <= in4;
				when "101" => outp <= in5;
				when "110" => outp <= in6;
				when others => outp <= in7;
			end case;
	end process;
end Behavioral;

