----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer:  Kishore Muthukulathu Devasia
-- 
-- Create Date:    01:17:42 06/08/2017 
-- Design Name: 
-- Module Name:    IFLAG - Behavioral 
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

entity IFLAG is
    Port ( clk : in  STD_LOGIC;
           enIFLAG : in  STD_LOGIC;
			  intr_extr : in STD_LOGIC_VECTOR(7 downto 0);
           d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (15 downto 0));
end IFLAG;

architecture Behavioral of IFLAG is
begin
	process (clk, intr_extr)
		begin
			if rising_edge(clk) then
				if enIFLAG = '1' then
					q <= d;
				end if;
			end if;
			
			-- If the interrupt is from external interrupt lines, 
			-- update the IFLAG register asynchronously.
			-- else wait till next clock cycle
			if (intr_extr(7) = '1') then
				q(7) <= '1';
			end if;
			if (intr_extr(6) = '1') then
				q(6) <= '1';
			end if;
			if (intr_extr(5) = '1') then
				q(5) <= '1';
			end if;
			if (intr_extr(4) = '1') then
				q(4) <= '1';
			end if;
			if (intr_extr(3) = '1') then
				q(3) <= '1';
			end if;
			if (intr_extr(2) = '1') then
				q(2) <= '1';
			end if;
			if (intr_extr(1) = '1') then
				q(1) <= '1';
			end if;
			if (intr_extr(0) = '1') then
				q(0) <= '1';
			end if;
	end process;	
end Behavioral;

