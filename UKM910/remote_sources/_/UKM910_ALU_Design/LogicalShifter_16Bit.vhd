----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    11:22:37 06/06/2017 
-- Design Name:    UKM910 ALU Design
-- Module Name:    LogicalShifter_16Bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicalShifter_16Bit is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           nBit : in  STD_LOGIC;
           shiftrot : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end LogicalShifter_16Bit;

architecture Behavioral of LogicalShifter_16Bit is
	signal unsignedA : unsigned (15 downto 0):= "0000000000000000";
	signal shiftvector : std_logic_vector ( 2 downto 0) := "000";
begin

	shiftvector <= nBit&shiftrot&dir;
	-- dir -> shift/rot direction; '0' - right ; '1' - left
	-- shiftrot -> shift/rotate ; '0' - shift ; '1' - rotate
	-- nBit -> shift/rot enable ; '1' - do shift/rotate
	process (A, shiftvector)
		begin
			case (shiftvector) is
				when "100" => unsignedA <= shift_right (unsigned(A), 1);
				when "101" => unsignedA <= shift_left (unsigned(A), 1);
				when "110" => unsignedA <= rotate_right (unsigned(A), 1);
				when "111" => unsignedA <= rotate_right (unsigned(A), 1);
				when others => unsignedA <= unsigned(A);
			end case;
	end process;

	C <= std_logic_vector (unsignedA);
	
end Behavioral;

