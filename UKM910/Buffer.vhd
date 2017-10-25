----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer:  Kishore Muthukulathu Devasia
-- 
-- Create Date:    01:33:41 05/31/2017 
-- Design Name: 
-- Module Name:    Buffer_16Bits - Behavioral 
-- Project Name: 	 UKM910  
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

entity Buffer_16Bits is
    Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC);
end Buffer_16Bits;

architecture Behavioral of Buffer_16Bits is

begin
	process (inp, en)
		begin
			if en = '1' then
				outp <= inp;
			else
				outp <= "ZZZZZZZZZZZZZZZZ";
			end if;
	end process;

end Behavioral;

