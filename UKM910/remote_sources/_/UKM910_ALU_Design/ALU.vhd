----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    19:21:21 06/05/2017 
-- Design Name: 	 UKM910 ALU Design
-- Module Name:    ALU - Structural 
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
-- Reference for ALU Architecture
-- Script for VLSI System Design, Summer Term 2017, Fritz Huettinger Chair of Microelectronics
-----------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           ALUFunc : in  STD_LOGIC_VECTOR (3 downto 0);
           nBit : in  STD_LOGIC;
           shiftrot : in  STD_LOGIC;
           dir : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (15 downto 0);
			  ov : out STD_LOGIC;
           cout : out  STD_LOGIC;
           z : out  STD_LOGIC;
           n : out  STD_LOGIC);
end ALU;

architecture Structural of ALU is
	-- Signal declarations to interconnect various components in the ALU
	signal opAND, opOR, opXOR, opAdder, Asel, Bsel, AdderAin, AdderBin, fnDecoderop, alop, shiftop : std_logic_vector (15 downto 0);
	signal Ainv, Binv : std_logic_vector (15 downto 0);
	
	------------------------------------------------------------
	------ Declaring the components in ALU structure -----------
	------------------------------------------------------------
	
	component AND_2Input_16Bit is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component OR_2Input_16Bit is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component XOR_2Input_16Bit is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component MUX_2Input_16Bit is
		 Port ( I0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  I1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  sel : in  STD_LOGIC;
				  outp : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component MUX_4Input_16Bit is
		 Port ( I0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  I1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  I2 : in  STD_LOGIC_VECTOR (15 downto 0);
				  I3 : in  STD_LOGIC_VECTOR (15 downto 0);
				  sel : in  STD_LOGIC_VECTOR (1 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	component FullAdder_2Input_16Bit is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  B : in  STD_LOGIC_VECTOR (15 downto 0);
				  cin : in  STD_LOGIC;
				  outp : out  STD_LOGIC_VECTOR (15 downto 0);
				  ov : out STD_LOGIC;
				  cout : out  STD_LOGIC);
	end component;
	component Decoder4x16 is
		 Port ( inp : in  STD_LOGIC_VECTOR (3 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component LogicalShifter_16Bit is
		 Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
				  nBit : in  STD_LOGIC;
				  shiftrot : in  STD_LOGIC;
				  dir : in  STD_LOGIC;
				  C : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;

begin
	
	Ainv <= "1111111111111111" when fnDecoderop(4) = '1' else 
			  "0000000000000000" when fnDecoderop(4) = '0';
	Binv <= "1111111111111111" when fnDecoderop(3) = '1' else 
			  "0000000000000000" when fnDecoderop(3) = '0';
	
	ALUFnDecoder : Decoder4x16 port map (
						inp => ALUFunc, 
						outp => fnDecoderop);
						
	ANDAB : AND_2Input_16Bit 
			port map (
				A => A, 
				B => B, 
				C => opAND);
				
	ORAB  : OR_2Input_16Bit 
			port map (
				A => A, 
				B => B, 
				C => opOR);
				
	XORAB : XOR_2Input_16Bit 
			port map (
				A => A, 
				B => B, 
				C => opXOR);
				
	MUXSelA: MUX_2Input_16Bit 
			port map (
				I0 => "0000000000000000", 
				I1=> A, 
				sel=> fnDecoderop(6), 
				outp=> Asel);
				
	MUXSelB: MUX_2Input_16Bit 
			port map (
				I0 => "0000000000000000", 
				I1=> B, 
				sel=> fnDecoderop(5), 
				outp=> Bsel);
				
	XORAinv : XOR_2Input_16Bit 
			port map (
				A => Asel, 
				B => Ainv, 
				C => AdderAin);
				
	XORBinv : XOR_2Input_16Bit 
			port map (
				A => Bsel, 
				B => Binv, 
				C => AdderBin);
				
	FullAdder : FullAdder_2Input_16Bit 
			port map (
				A => AdderAin, 
				B => AdderBin, 
				cin => fnDecoderop(2), 
				outp => opAdder,
				ov => ov,
				cout=> cout);
				
	MUXSelRes : MUX_4Input_16Bit 
			port map (
				I0 => opAND, 
				I1 => opOR, 
				I2 => opXOR, 
				I3 => opAdder, 
				sel => fnDecoderop(1 downto 0), 
				outp => alop);
				
	logicshifter : LogicalShifter_16Bit 
			port map (
				A => alop, 
				nBit => nBit, 
				shiftrot=> shiftrot, 
				dir => dir, 
				C => shiftop);
	

	zerocheck : process(A, B, ALUFunc, nBit, shiftrot, dir, shiftop)
		begin
			case shiftop is
				when "0000000000000000" => z <= '1';
				when others => z <= '0';
			end case;
	end process;
	
	negcheck : process (A, B, ALUFunc, nBit, shiftrot, dir, shiftop)
		begin
			if (signed(shiftop) < 0) then
				n <= '1';
			else
				n <= '0';
			end if;
	end process;

	C <= shiftop;
	
end Structural;

