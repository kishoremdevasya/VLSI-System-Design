----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    21:34:46 06/05/2017 
-- Design Name: 	 UKM910 ALU Design
-- Module Name:    FullAdder_2Input_1Bit - Behavioral 
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

entity FullAdder_2Input_1Bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           C : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end FullAdder_2Input_1Bit;

architecture Behavioral of FullAdder_2Input_1Bit is

begin
	process (A, B, cin)
	begin
		C <= A xor B xor cin;
		cout <= (A and B) or (B and cin) or (cin and A);
	end process;

end Behavioral;

