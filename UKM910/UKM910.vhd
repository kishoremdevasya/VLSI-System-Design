----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    00:54:03 06/08/2017 
-- Design Name: 
-- Module Name:    UKM910 - Structural 
-- Project Name:	 UKM910 
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
use work.all;

entity UKM910 is
    Port ( clk : in  STD_LOGIC;
           res : in  STD_LOGIC;
           interrupts : in  STD_LOGIC_VECTOR (7 downto 0);
           oe : out  STD_LOGIC;
           wren : out  STD_LOGIC;
           addressbus : out  STD_LOGIC_VECTOR (11 downto 0);
           databus : inout  STD_LOGIC_VECTOR (15 downto 0));
end UKM910;

architecture Structural of UKM910 is

	signal aluAin, aluBin, aluOutp, accOutp, irinp, irOutp, pcoutp, spOutp, 
			 ptr1Outp, ptr2Outp, ptr3Outp, pswinp, pswOutp, ieninp, ienOutp, 
			 iflaginp, iflagOutp, IENControlout, IFLAGControlout : std_logic_vector ( 15 downto 0);
	
	signal intr_external_logged : std_logic_vector (7 downto 0);
			 
	signal enPC, enIR, enAcc, enSP, enPTR1, enPTR2, enPTR3, enPSW, 
			 enIEN, enIFLAG, enRes, selA, nBit, shiftrot, dir,
			 selIENin, selPSWin, ov, cout, z, n : std_logic; 
			 
	signal selB, ALUFunc : std_logic_vector (3 downto 0);
	signal selIRin : std_logic_vector (2 downto 0);
	signal selAddr : std_logic_vector (2 downto 0);
	signal selIFLAGin : std_logic;
	
	component ALU is
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
	end component;
	
	component Control_Unit is
		 Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  opcode : in  STD_LOGIC_VECTOR (15 downto 0);
				  PSW : in  STD_LOGIC_VECTOR (15 downto 0);
				  IEN : in  STD_LOGIC_VECTOR (15 downto 0);
				  IFLAG : in  STD_LOGIC_VECTOR (15 downto 0);
				  IENout : out  STD_LOGIC_VECTOR (15 downto 0);
				  IFLAGout : out  STD_LOGIC_VECTOR (15 downto 0);
				  enPC : out STD_LOGIC;
				  enIR : out STD_LOGIC;
				  enAcc : out STD_LOGIC;
				  enSP : out STD_LOGIC;
				  enPTR1 : out STD_LOGIC;
				  enPTR2 : out STD_LOGIC;
				  enPTR3 : out STD_LOGIC;
				  enPSW : out STD_LOGIC;
				  enIEN : out STD_LOGIC;
				  enIFLAG : out STD_LOGIC;
				  enRes : out STD_LOGIC;
				  selA : out STD_LOGIC;
				  selB : out STD_LOGIC_VECTOR (3 downto 0);
				  selAddr : out STD_LOGIC_VECTOR (2 downto 0);
				  ALUFunc : out STD_LOGIC_VECTOR (3 downto 0);
				  nBit :  out STD_LOGIC;
				  shiftrot : out STD_LOGIC;
				  dir : out STD_LOGIC;
				  we : out STD_LOGIC;
				  oe : out STD_LOGIC;
				  selIFLAGin : out STD_LOGIC;
				  selIENin : out STD_LOGIC;
				  selPSWin : out STD_LOGIC;
				  selIRin : out STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component Register_16Bits is
		 Port ( clk : in  STD_LOGIC;
				  en : in  STD_LOGIC;
				  d : in  STD_LOGIC_VECTOR (15 downto 0);
				  q : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component IFLAG is
		 Port ( clk : in  STD_LOGIC;
				  enIFLAG : in  STD_LOGIC;
				  intr_extr : in STD_LOGIC_VECTOR(7 downto 0);
				  d : in  STD_LOGIC_VECTOR (15 downto 0);
				  q : out  STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	component MUX_2to1_16Bits is
		 Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0);
				  sel : in  STD_LOGIC);
	end component;
	
	component MUX_16to1_16Bits is
		 Port ( in0 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in2 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in3 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in4 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in5 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in6 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in7 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in8 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in9 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in10 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in11 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in12 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in13 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in14 : in  STD_LOGIC_VECTOR (15 downto 0);
				  in15 : in  STD_LOGIC_VECTOR (15 downto 0);
				  outp : out  STD_LOGIC_VECTOR (15 downto 0);
				  sel : in  STD_LOGIC_VECTOR (3 downto 0));
		end component;
		
		component MUX_8to1_12Bits is
			 Port ( in0 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in1 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in2 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in3 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in4 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in5 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in6 : in  STD_LOGIC_VECTOR (11 downto 0);
					  in7 : in  STD_LOGIC_VECTOR (11 downto 0);
					  outp : out  STD_LOGIC_VECTOR (11 downto 0);
					  sel : in  STD_LOGIC_VECTOR (2 downto 0));
		end component;
		
		component MUX_8to1_16Bits is
			Port (  in0 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in1 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in2 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in3 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in4 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in5 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in6 : in  STD_LOGIC_VECTOR (15 downto 0);
					  in7 : in  STD_LOGIC_VECTOR (15 downto 0);
					  outp : out  STD_LOGIC_VECTOR (15 downto 0);
					  sel : in  STD_LOGIC_VECTOR (2 downto 0));
		end component;
		
		component Buffer_16Bits is
			 Port ( inp : in  STD_LOGIC_VECTOR (15 downto 0);
					  outp : out  STD_LOGIC_VECTOR (15 downto 0);
					  en : in  STD_LOGIC);
		end component;
		
		component Interrupt_Logger is
			 Port ( intr_in : in  STD_LOGIC_VECTOR (7 downto 0);
					  crtl_intr_clr : in STD_LOGIC_VECTOR (7 downto 0);
					  intr_out : out  STD_LOGIC_VECTOR (7 downto 0));
		end component;
begin
	
	alunit : ALU port map (
			 A => aluAin, B => aluBin, ALUFunc => ALUFunc, 
			 nBit => nBit, shiftrot => shiftrot, dir => dir, 
			 C => aluOutp, ov => ov, cout => cout, z => z, n => n);
	
	control : Control_Unit port map (
			   clk => clk, reset => res, opcode => irOutp, PSW => pswOutp, 
				IEN => ienOutp, IFLAG => iflagOutp, IENout => IENControlout,
			   IFLAGout => IFLAGControlout, enPC => enPC, enIR => enIR,
			   enAcc => enAcc, enSP => enSP, enPTR1 => enPTR1, enPTR2 => enPTR2,
				enPTR3 => enPTR3, enPSW => enPSW, enIEN => enIEN, enIFLAG => enIFLAG,
				enRes => enRes, selA => selA, selB => selB, selAddr => selAddr,
				ALUFunc => ALUFunc, nBit => nBit, shiftrot => shiftrot,
				dir => dir, we => wren, oe => oe, selIFLAGin => selIFLAGin,
				selIENin => selIENin, selPSWin => selPSWin, selIRin => selIRin);
	
	accumalator : Register_16Bits port map (
			 clk => clk, en => enAcc, d => aluOutp, q => accOutp);
	
	IR :  Register_16Bits port map (
			 clk => clk, en => enIR, d => irinp, q => irOutp);
	
	PC : Register_16Bits port map (
			 clk => clk, en => enPC, d => aluOutp, q => pcoutp);
	
	SP : Register_16Bits port map (
			 clk => clk, en => enSP, d => aluOutp, q => spOutp);
			 
	PTR1 : Register_16Bits port map (
			 clk => clk, en => enPTR1, d => aluOutp, q => ptr1Outp); 
			 
	PTR2 : Register_16Bits port map (
			 clk => clk, en => enPTR2, d => aluOutp, q => ptr2Outp);
	
	PTR3 : Register_16Bits port map (
			 clk => clk, en => enPTR3, d => aluOutp, q => ptr3Outp);
	
	PSW : Register_16Bits port map (
			 clk => clk, en => enPSW, d => pswinp, q => pswOutp);
			 
	IEN : Register_16Bits port map (
			 clk => clk, en => enIEN, d => ieninp, q => ienOutp);
			 
	IFLAGREG : IFLAG port map (
			 clk => clk, enIFLAG => enIFLAG, intr_extr => intr_external_logged, d => iflaginp, q => iflagOutp);
	
	aluAinMux : MUX_2to1_16Bits port map (
			 in0 => accOutp, in1 => x"0001", outp => aluAin, sel => selA);
			 
	aluBinMux : MUX_16to1_16Bits port map (
			 in0 => x"0000", in1 => databus, in2 => pcoutp, 
			 in3(15 downto 12) => "0000", in3(11 downto 0) => irOutp (11 downto 0), 
			 in4 => spOutp, in5 => ptr1Outp, in6 => ptr2Outp, in7 => ptr3Outp, in8 => ienOutp, in9 => iflagOutp, 
			 in10 => pswOutp, in11 => "ZZZZZZZZZZZZZZZZ", in12 => "ZZZZZZZZZZZZZZZZ", in13 => "ZZZZZZZZZZZZZZZZ", 
			 in14 => "ZZZZZZZZZZZZZZZZ", in15 => "ZZZZZZZZZZZZZZZZ", outp => aluBin, sel => selB);
			 
	addrbusMux : MUX_8to1_12Bits port map (
			 in0 => pcoutp(11 downto 0), in1 => irOutp(11 downto 0), in2 => spOutp(11 downto 0), 
			 in3 => ptr1Outp(11 downto 0), in4 => ptr2Outp(11 downto 0), in5 => ptr3Outp (11 downto 0),
			 in6 => "ZZZZZZZZZZZZ", in7 => "ZZZZZZZZZZZZ", outp => addressbus, 
			 sel => selAddr);
	databusBuffer : Buffer_16Bits port map (
			 inp => aluOutp, outp => databus, en => enRes);
	
	pswMux : MUX_2to1_16Bits port map (
			 in1 => aluOutp, 
			 in0 (15 downto 4) => pswOutp (15 downto 4), 
			 in0(3) => ov, in0(2) => cout, in0(1) => n, in0(0) => z,
			 outp => pswinp, sel => selPSWin);
			 
	intMux : MUX_2to1_16Bits port map (
			 in0 => aluOutp,
			 in1 => IFLAGControlout,
			 outp => iflaginp, sel => selIFLAGin);
	
	irMux : MUX_8to1_16Bits port map (
			 in0 => aluOutp, in1 => x"0001", in2 => x"0002", in3 => x"0003", in4 => x"0004",
			 in5 => x"0005", in6 => x"0006", in7 => x"0007", outp => irinp, sel => selIRin);
	
	ienMux : MUX_2to1_16Bits port map (
			 in0 => aluOutp, in1 => IENControlout, outp=> ieninp, sel => selIENin);
			 
	intr_logger : Interrupt_Logger port map (
			 intr_in => interrupts, crtl_intr_clr => IFLAGControlout(7 downto 0), 
			 intr_out => intr_external_logged);
			 
end Structural;

