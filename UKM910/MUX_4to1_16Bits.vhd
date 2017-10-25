----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    13:14:26 06/09/2017 
-- Design Name: 
-- Module Name:    MUX_4to1_16Bits - Behavioral 
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

entity MUX_4to1_16Bits is
	port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
          in1 : in  STD_LOGIC_VECTOR (15 downto 0);
          in2 : in  STD_LOGIC_VECTOR (15 downto 0);
          in3 : in  STD_LOGIC_VECTOR (15 downto 0);
			 outp : out  STD_LOGIC_VECTOR (15 downto 0);
          sel : in  STD_LOGIC_VECTOR (1 downto 0));
end MUX_4to1_16Bits;

architecture Behavioral of MUX_4to1_16Bits is

begin
	process (in0, in1, in2, in3, sel)
		begin
			case sel is
				when "00" => outp <= in0;
				when "01" => outp <= in1;
				when "10" => outp <= in2;
				when others => outp <= in3;
			end case;
	end process;
end Behavioral;

