----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    19:29:17 06/05/2017 
-- Design Name:	 UKM910 ALU Design 
-- Module Name:    OR_2Input_16Bit - Behavioral 
-- Project Name:	 UKM910 
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

entity OR_2Input_16Bit is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end OR_2Input_16Bit;

architecture Behavioral of OR_2Input_16Bit is

begin

	process (A, B) is
		begin
			C <= A or B;
	end process;

end Behavioral;

