----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer:  Kishore Muthukulathu Devasia 
-- 
-- Create Date:    01:14:50 06/08/2017 
-- Design Name: 
-- Module Name:    PSW - Behavioral 
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

entity PSW is
    Port ( clk : in  STD_LOGIC;
           enPSW : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end PSW;

architecture Behavioral of PSW is

begin
	process (clk)
		begin
			if rising_edge(clk) then
				if enPSW = '1' then
					q <= d;
				end if;
			end if;
	end process;	
end Behavioral;

