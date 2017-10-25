----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer:  Kishore Muthukulathu Devasia
-- 
-- Create Date:    01:32:49 06/08/2017 
-- Design Name: 
-- Module Name:    MUX_2to1_16Bits - Behavioral 
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

entity MUX_2to1_16Bits is
    Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC);
end MUX_2to1_16Bits;

architecture Behavioral of MUX_2to1_16Bits is
begin
	process (in0, in1, sel)
		begin
			case sel is
				when '0' => outp <= in0;
				when others => outp <= in1;
			end case;
	end process;
end Behavioral;

