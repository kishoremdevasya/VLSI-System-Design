----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    22:09:32 05/30/2017 
-- Design Name: 	 
-- Module Name:    Accumalator - Behavioral 
-- Project Name:	 UKM910 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		Design of Accumalator of UKM910
--		Accumalator is 16 bit wide
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

entity Accumalator is
    Port ( clk : in  STD_LOGIC;
			  enAcc : in STD_LOGIC;
           d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end Accumalator;

architecture Behavioral of Accumalator is

begin

	process(clk)
		begin
			-- We can use (clk'event and clk='1') 
			if rising_edge(clk) then
				if enAcc = '1' then
					q <= d;
				end if;
			end if;
	end process;

end Behavioral;

