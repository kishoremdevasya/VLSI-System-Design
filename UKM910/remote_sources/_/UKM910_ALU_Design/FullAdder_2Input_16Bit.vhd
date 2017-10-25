----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg 
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    21:15:00 06/05/2017 
-- Design Name:	 UKM910 ALU Design 
-- Module Name:    FullAdder_2Input_16Bit - Behavioral 
-- Project Name:	 UKM910 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--	This is a 16 Bit ripple carry adder
-- The design uses 16 one bit full adders
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

entity FullAdder_2Input_16Bit is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
           outp : out  STD_LOGIC_VECTOR (15 downto 0);
			  ov : out STD_LOGIC;
           cout : out  STD_LOGIC);
end FullAdder_2Input_16Bit;

architecture Structural of FullAdder_2Input_16Bit is
	signal c : std_logic_vector (16 downto 0);
	-- signal ov : std_logic_vector;
	component FullAdder_2Input_1Bit is
		 Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  cin : in  STD_LOGIC;
				  C : out  STD_LOGIC;
				  cout : out  STD_LOGIC);
	end component;
begin

   -------------------------------------------------------------------
	-- The Design uses 16 one bit full adders to create a 16 bit adder
	-------------------------------------------------------------------
	c(0) <= cin;
	FA0: FullAdder_2Input_1Bit port map (A(0), B(0), c(0), outp(0), c(1));
	FA1: FullAdder_2Input_1Bit port map (A(1), B(1), c(1), outp(1), c(2));
	FA2: FullAdder_2Input_1Bit port map (A(2), B(2), c(2), outp(2), c(3));
	FA3: FullAdder_2Input_1Bit port map (A(3), B(3), c(3), outp(3), c(4));
	FA4: FullAdder_2Input_1Bit port map (A(4), B(4), c(4), outp(4), c(5));
	FA5: FullAdder_2Input_1Bit port map (A(5), B(5), c(5), outp(5), c(6));
	FA6: FullAdder_2Input_1Bit port map (A(6), B(6), c(6), outp(6), c(7));
	FA7: FullAdder_2Input_1Bit port map (A(7), B(7), c(7), outp(7), c(8));
	FA8: FullAdder_2Input_1Bit port map (A(8), B(8), c(8), outp(8), c(9));
	FA9: FullAdder_2Input_1Bit port map (A(9), B(9), c(9), outp(9), c(10));
	FA10: FullAdder_2Input_1Bit port map (A(10), B(10), c(10), outp(10), c(11));
	FA11: FullAdder_2Input_1Bit port map (A(11), B(11), c(11), outp(11), c(12));
	FA12: FullAdder_2Input_1Bit port map (A(12), B(12), c(12), outp(12), c(13));
	FA13: FullAdder_2Input_1Bit port map (A(13), B(13), c(13), outp(13), c(14));
	FA14: FullAdder_2Input_1Bit port map (A(14), B(14), c(14), outp(14), c(15));
	FA15: FullAdder_2Input_1Bit port map (A(15), B(15), c(15), outp(15), c(16));
	
	cout <= c(16);
	-- overflow flag
	ov <= c(16) xor c(15);
	
end Structural;

