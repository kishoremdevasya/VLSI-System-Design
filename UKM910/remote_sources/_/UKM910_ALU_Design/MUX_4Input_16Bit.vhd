----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    19:42:26 06/05/2017 
-- Design Name: 	 UKM910 ALU Design
-- Module Name:    MUX_4Input_16Bit - Behavioral 
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

entity MUX_4Input_16Bit is
    Port ( I0 : in  STD_LOGIC_VECTOR (15 downto 0);
           I1 : in  STD_LOGIC_VECTOR (15 downto 0);
           I2 : in  STD_LOGIC_VECTOR (15 downto 0);
           I3 : in  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           outp : out  STD_LOGIC_VECTOR (15 downto 0));
end MUX_4Input_16Bit;

architecture Behavioral of MUX_4Input_16Bit is

begin

	process (I0, I1, I2, I3, sel)
		begin
			case sel is 
				when "00" => outp <= I0;
				when "01" => outp <= I1;
				when "10" => outp <= I2;
				when others => outp <= I3;
			end case;
	end process;
end Behavioral;

