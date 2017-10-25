----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    13:18:42 06/16/2017 
-- Design Name: 
-- Module Name:    DFlipFlop - Behavioral 
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

entity DFlipFlop is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end DFlipFlop;

architecture Behavioral of DFlipFlop is

begin

	process (clk, rst)
		begin
			if (rst = '0') then
				q <= '0';
			elsif rising_edge (clk) then
				q <= d;
			end if;
	end process;

end Behavioral;

