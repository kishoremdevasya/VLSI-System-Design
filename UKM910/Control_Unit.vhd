----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    22:28:52 06/06/2017 
-- Design Name: 	 UKM910 Control Unit
-- Module Name:    Control_Unit - Behavioral 
-- Project Name: 	 UKM910
-- Target Devices: 
-- Tool versions: 
-- Description: 
----------------------------------------------------------------------------------
 -- This design defines the states of the processor and will generate microprogram 
 -- for the execution of each state. 
 -------------------------------------------------------------------------------------------------------------------------------------------
 -- selPSWin -> Select input to the PSW ; '1' -> ALU Out ; '0' -> 'ov c n z' Flags
 -- selINTin -> Select input to the IFLAG Reg ; '0' -> External Interrupt ; '1' -> ALU Out
 -- OE -> Output Enable ; set '1' to write to address bus for memory read
 -- WE -> Write enabled ; set '1' to write to databus for memory write
 -- dir -> shift/rot direction; '0' - right ; '1' - left
 -- shiftrot -> shift/rotate ; '0' - shift ; '1' - rotate
 -- nBit -> shift/rot enable ; '1' - do shift/rotate
 -- ALUFunc (4 bits) -> ALU Function to be performed. For details refer ALU.vhd
 -- selAddr (3 bits) -> Select output to address Bus
 --							"000"  -->  PC (11:0)
 --							"001"  -->  IR (11:0)
 --							"010"	 -->	SP (11:0)
 --							"011"	 -->	PTR1 (11:0)
 --							"100"	 -->	PTR2 (11:0)
 --							"101"	 -->	PTR3 (11:0)
 --							others --> 	High impedence 
 -- selB (4 bits) -> Input to the B in of ALU
 --							"0000" -->  x"0000"
 --							"0001" -->	databus
 --							"0010" -->  PC
 --							"0011" -->	IR
 --							"0100" -->	SP
 --							"0101" -->	PTR1
 --							"0110" -->	PTR2
 --							"0111" -->	PTR3
 --							"1000" -->	IEN
 --							"1001" -->	IFLAG
 --							"1010" -->	PSW
 --							others -->	High impedence (Reserved for future use)
 -- selA -> Input to the Ain of ALU ; '0' - Acc ; '1' - x"0001" (For Decrementing the SP/PC)
 -- enRes -> set to '1' to enable the output buffer to write data to databus
 -- enFLAG -> set to '1' to write ALU op to IFLAG
 -- enIEN -> set to '1' to write to IEN
 -- enPSW -> set to '1' to upate PSW
 -- enPTR3 -> set to '1' to upate PTR3 
 -- enPTR2 -> set to '1' to upate PTR2
 -- enPTR1 -> set to '1' to upate PTR1
 -- enSP -> set to '1' to upate SP
 -- enACC -> set to '1' to upate ACC
 -- enIR -> set to '1' to upate IR
 -- enPC -> set to '1' to upate PC
----------------------------------------------------------------------------------
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

entity Control_Unit is
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
			  selIRin : out STD_LOGIC_VECTOR (2 downto 0)
			);
end Control_Unit;

architecture Behavioral of Control_Unit is

	type states is (	IDLE, RST,
							IF0, IF1, 								-- states to fetch the instruction from memory
							DCD,										-- Decode the instruction			
							NT0, RTR0, SHR0, STR0, LDR0, STRR0, STRI0, JMP0, BZ0, BN0,
							AD0, AD1,								-- states for executing the ADD instrunction
							SB0, SB1,								-- states for executing the SUB instrunction
							AN0, AN1,								-- states for executing the AND instrunction
							CMP0, CMP1,								-- states for executing the COMP instrunction
							LD0, LD1,								-- states for executing the LOAD instrunction
							LDI0, LDI1,								-- states for executing the LOADI instrunction
							STRIINC0,STRIINC1,					-- states for executing the STOREIINC instrunction
							STRIDEC0, STRIDEC1,					-- states for executing the STOREIDEC instrunction
							LDIINC0, LDIINC1, LDIINC2,			-- states for executing the LOADIINC instrunction
							LDIDEC0, LDIDEC1, LDIDEC2,			-- states for executing the LOADIDEC instrunction
							RT0, RT1, RT2,							-- states for executing the RET instrunction
							CL0, CL1, CL2,							-- states for executing the CALL instruction
							RTI0, RTI1, RTI2, RTI3,				-- states for executing the RETI instruction
							INTR1, INTR2, INTR3, INTR4,
							INTR5, INTR6, INTR7					-- states for handling the interrupt
							);
	signal state : states := IDLE;
	
	-- Constants defining the opcode[15:12]
	constant NOP 		: std_logic_vector (3 downto 0) := "0000";
	constant ADD 		: std_logic_vector (3 downto 0) := "0001";
	constant SUB 		: std_logic_vector (3 downto 0) := "0010";
	constant ANDOP 	: std_logic_vector (3 downto 0) := "0011";
	constant NOTOP 	: std_logic_vector (3 downto 0) := "0100";
	constant COMP		: std_logic_vector (3 downto 0) := "0101";
	constant ROTR		: std_logic_vector (3 downto 0) := "0110";
	constant SHR		: std_logic_vector (3 downto 0) := "0111";
	constant LOAD		: std_logic_vector (3 downto 0) := "1000";
	constant STORE		: std_logic_vector (3 downto 0) := "1001";
	constant LOADOP	: std_logic_vector (3 downto 0) := "1010";
	constant STOREOP	: std_logic_vector (3 downto 0) := "1011";
	constant JUMP		: std_logic_vector (3 downto 0) := "1100";
	constant BZ			: std_logic_vector (3 downto 0) := "1101";
	constant BN			: std_logic_vector (3 downto 0) := "1110";
	constant CALL		: std_logic_vector (3 downto 0) := "1111";	
	
	-- The LOADOP defines some additional bits for some more functions
	-- The state machine generates the microprogram based on this bits
	-- opcode [11:4]
	constant LOADR		: std_logic_vector (7 downto 0) := "00000000";
	constant LOADI		: std_logic_vector (7 downto 0) := "00000001";
	constant LOADIINC	: std_logic_vector (7 downto 0) := "00000010";
	constant LOADIDEC	: std_logic_vector (7 downto 0) := "00000011";
	constant RET		: std_logic_vector (7 downto 0) := "00010000";
	constant RETI		: std_logic_vector (7 downto 0) := "00100000";
	
	-- The STOREOP defines some additional bits for some more functions
	-- The state machine generates the microprogram based on this bits
	-- opcode [11:8]
	constant STORER	: std_logic_vector (3 downto 0) := "0000";
	constant STOREI	: std_logic_vector (3 downto 0) := "0001";
	constant STOREIINC: std_logic_vector (3 downto 0) := "0010";
	constant STOREIDEC: std_logic_vector (3 downto 0) := "0011";
	
	-- Function to identify the interrupt state when an interrupt occurs
	-- After executing every instruction, the processor checks if an 
	-- interrupt has occured using IFLAG register. If there is an interrupt
	-- processor moves to corresponding interrupt handling state if that is enabled
	
	function interrupt_state ( IEN : STD_LOGIC_VECTOR (15 downto 0);
										IFLAG : STD_LOGIC_VECTOR (15 downto 0))
	return states is 
		variable intr_state : states := IF0;
		begin 
			if (IFLAG /= x"0000") then
				if (IEN (8) = '1') then
					if (IFLAG(7) = '1') then
						if (IEN (7) = '1') then
							intr_state := INTR7;
						else
							intr_state := IF0;
						end if;
					elsif (IFLAG(6) = '1') then
							if (IEN(6) = '1') then
								intr_state := INTR6;
							else
								intr_state := IF0;
							end if;
						elsif (IFLAG(5) = '1') then
								if (IEN(5) = '1') then
									intr_state := INTR5;
								else
									intr_state := IF0;
								end if;
							elsif (IFLAG(4) = '1') then
									if (IEN(4) = '1') then
										intr_state := INTR4;
									else
										intr_state := IF0;
									end if;
								elsif (IFLAG(3) = '1') then
										if(IEN(3) = '1') then
											intr_state := INTR3;
										else
											intr_state := IF0;
										end if;
									elsif (IFLAG(2) = '1') then
											if (IEN(2) = '1') then
												intr_state := INTR2;
											else
												intr_state := IF0;
											end if;
										elsif (IFLAG(1) = '1') then
												if(IEN(1) = '1') then
													intr_state := INTR1;
												else
													intr_state := IF0;
												end if;
											elsif (IFLAG(0) = '1') then
													if (IEN(0) = '1') then
														intr_state := RST;
													else
														intr_state := IF0;
													end if;
												else
													intr_state := IF0;		
											end if;
				else
					intr_state := IF0;
				end if;
			else
				intr_state := IF0;
			end if;
			
			return intr_state;
		end interrupt_state;

begin

	-- process implementing a mealy state machine
	statemachine : process (clk)
	begin
		if (reset = '1') then
			state <= RST;
		else if rising_edge (clk) then
				case state is
					when RST => state <= interrupt_state (IEN, IFLAG);
					when IF0 => state <= IF1;
					when IF1 => state <= DCD;
					when DCD => case opcode (15 downto 12) is
										when NOP => state <= interrupt_state (IEN, IFLAG);
										when ADD => state <= AD0;
										when SUB => state <= SB0;
										when ANDOP => state <= AN0;
										when NOTOP => state <= NT0;
										when COMP => state <= CMP0;
										when ROTR => state <= RTR0;
										when SHR => state <= SHR0;
										when LOAD => state <= LD0;
										when STORE => state <= STR0;
										when LOADOP => case opcode (11 downto 4) is
																when LOADR => state <= LDR0;
																when LOADI => state <= LDI0;
																when LOADIINC => state <= LDIINC0;
																when LOADIDEC => state <= LDIDEC0;
																when RET => state <= RT0;
																when RETI => state <= RTI0;
																when others => state <= interrupt_state (IEN, IFLAG);
															end case;
										when STOREOP => case opcode (7 downto 4) is
																when STORER => state <= STRR0;
																when STOREI => state <= STRI0;
																when STOREIINC => state <= STRIINC0;
																when STOREIDEC => state <= STRIDEC0;
																when others => state <= interrupt_state (IEN, IFLAG);
															 end case;
										when JUMP => state <= JMP0;
										when BZ => state <= BZ0;
										when BN => state <= BN0;
										when CALL => state <= CL0;
										when others => state <= interrupt_state (IEN, IFLAG);
									end case;
					when AD0 => state <= AD1;
					when AD1 => state <= interrupt_state (IEN, IFLAG);
					when SB0 => state <= SB1;
					when SB1 => state <= interrupt_state (IEN, IFLAG);
					when AN0 => state <= AN1;
					when AN1 => state <= interrupt_state (IEN, IFLAG);
					when NT0 => state <= interrupt_state (IEN, IFLAG);
					when CMP0 => state <= CMP1;
					when CMP1 => state <= interrupt_state (IEN, IFLAG);
					when RTR0 => state <= interrupt_state (IEN, IFLAG);
					when SHR0 => state <= interrupt_state (IEN, IFLAG);
					when LD0 => state <= LD1;
					when LD1 => state <= interrupt_state (IEN, IFLAG);
					when STR0 => state <= interrupt_state (IEN, IFLAG);
					when LDR0 => state <= interrupt_state (IEN, IFLAG);
					when LDI0 => state <= LDI1;
					when LDI1 => state <= interrupt_state (IEN, IFLAG);
					when LDIINC0 => state <= LDIINC1;
					when LDIINC1 => state <= LDIINC2;
					when LDIINC2 => state <= interrupt_state (IEN, IFLAG);
					when LDIDEC0 => state <= LDIDEC1;
					when LDIDEC1 => state <= LDIDEC2;
					when LDIDEC2 => state <= interrupt_state (IEN, IFLAG);
					when RT0 => state <= RT1;
					when RT1 => state <= RT2;
					when RT2 => state <= interrupt_state (IEN, IFLAG);
					when RTI0 => state <= RTI1;
					when RTI1 => state <= RTI2;
					when RTI2 => state <= RTI3;
					when RTI3 => state <= interrupt_state (IEN, IFLAG);
					when STRR0 => state <= interrupt_state (IEN, IFLAG);
					when STRI0 => state <= interrupt_state (IEN, IFLAG);
					when STRIINC0 => state <= STRIINC1;
					when STRIINC1 => state <= interrupt_state (IEN, IFLAG);
					when STRIDEC0 => state <= STRIDEC1;
					when STRIDEC1 => state <= interrupt_state (IEN, IFLAG);
					when JMP0 => state <= interrupt_state (IEN, IFLAG);
					when BZ0 => state <= interrupt_state (IEN, IFLAG);
					when BN0 => state <= interrupt_state (IEN, IFLAG);
					when CL0 => state <= CL1;
					when CL1 => state <= CL2;
					when CL2 => state <= interrupt_state (IEN, IFLAG);
					when INTR1 => state <= CL0;
					when INTR2 => state <= CL0;
					when INTR3 => state <= CL0;
					when INTR4 => state <= CL0;
					when INTR5 => state <= CL0;
					when INTR6 => state <= CL0;
					when INTR7 => state <= CL0;
					when others => state <= interrupt_state (IEN, IFLAG);
				end case;
			end if;
		end if;
	end process;
	
	-- microprogram for each state in the state machine
	microprogramgenerator : process (state)
		begin
			  IENout <= IEN;
			  IFLAGout <= IFLAG;
			  enPC <= '0';
			  enIR <= '0';
			  enAcc <= '0';
			  enSP <= '0';
			  enPTR1 <= '0';
			  enPTR2 <= '0';
			  enPTR3 <= '0';
			  enPSW <= '0';
			  enIEN <= '0';
			  enIFLAG <= '0';
			  enRes <= '0';
			  selA <= '0';
			  selB <= "0000";
			  selAddr <= "000";
			  ALUFunc <= "0000";
			  nBit <= '0';
			  shiftrot <= '0';
			  dir <= '0';
			  we <= '0';
			  oe <= '0';
			  selIENin <= '0';
			  selPSWin <= '0';
			  selIRin <= "000";
			  selIFLAGin <= '0';
			  
			case state is
				when RST =>	-- Loading 0 on PC, listening for external interrupt
								enPC <= '1'; ALUFunc <= "0101";
				when IF0 =>	-- Placing $PC on address bus for memory read
								oe <= '1';
				when IF1 =>	-- Reading [$PC] to $IR
								ALUFunc <= "0101"; selB <= "0001"; enIR <= '1';
				when DCD => -- Increment program counter
								ALUFunc <= "0111"; selB <= "0010"; enPC <= '1';
				when AD0 => -- Place $IR[11:0] on address bus for memory read
								oe <= '1'; selAddr <= "001";
				when AD1 => -- Read [$IR[11:0]] and Add to Acc, place result in Acc
								ALUFunc <= "0001"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';
				when SB0 => -- Place $IR[11:0] on address bus for memory read
								oe <= '1'; selAddr <= "001";
				when SB1 =>	-- Read [$IR[11:0]] and subtract from Acc, place result in Acc
								ALUFunc <= "0010"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';
				when AN0 => -- Place $IR[11:0] on address bus for memory read
								oe <= '1'; selAddr <= "001";
				when AN1 => -- Read [$IR[11:0]] and logical and to Acc, place result in Acc
								ALUFunc <= "1000"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';
				when NT0 => -- Logical not operation of Acc and place the result in Acc
								ALUFunc <= "1100"; enPSW <= '1'; enAcc <= '1';
				when CMP0 => -- Logical not operation of Acc and place the result in Acc
								 ALUFunc <= "1100"; enPSW <= '1'; enAcc <= '1';
				when CMP1 => -- Incrementing the result of Acc and place the result in Acc
								 ALUFunc <= "0110"; enPSW <= '1'; enAcc <= '1';
				when RTR0 => -- Rotate acc and place the result in acc
								 dir <= '0'; shiftrot <= '1'; nBit <= '1'; ALUFunc <= "0100"; enPSW <= '1'; enAcc <= '1';
				when SHR0 => -- Shift acc right and place the result in acc
								 dir <= '0'; shiftrot <= '0'; nBit <= '1'; ALUFunc <= "0100"; enPSW <= '1'; enAcc <= '1';
				when LD0 => -- Place $IR[11:0] on address bus for memory read
								oe <= '1'; selAddr <= "001";
				when LD1 => -- Read [$IR[11:0]] and place in Acc
								ALUFunc <= "0101"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';
				when STR0 => -- store $Acc in [$IR[11:0]]
								 we <= '1'; ALUFunc <= "0100"; selAddr <= "001"; enRes <= '1';
				when LDR0 => case opcode (2 downto 0) is
									when "000" => -- Load $SP to $Acc
													  ALUFunc <= "0101"; selB <= "0100"; enPSW <= '1'; enAcc <= '1';
									when "001" => -- Load $PTR1 to $Acc
													  ALUFunc <= "0101"; selB <= "0101"; enPSW <= '1'; enAcc <= '1';				
									when "010" => -- Load $PTR2 to $Acc
													  ALUFunc <= "0101"; selB <= "0110"; enPSW <= '1'; enAcc <= '1';													  
									when "011" => -- Load $PTR3 to $Acc
													  ALUFunc <= "0101"; selB <= "0111"; enPSW <= '1'; enAcc <= '1';													  
									when "100" => -- Load $PSW to $Acc
													  ALUFunc <= "0101"; selB <= "1010"; enPSW <= '1'; enAcc <= '1';													  
									when "101" => -- Load $IEN to $Acc
													  ALUFunc <= "0101"; selB <= "1000"; enPSW <= '1'; enAcc <= '1';													  
									when "110" => -- Load $IFLAG to $Acc
													  ALUFunc <= "0101"; selB <= "1001"; enPSW <= '1'; enAcc <= '1';											
									when others => ALUFunc <= "0000";
								 end case;
				when LDI0 => case opcode (1 downto 0) is
									when "00" => -- Placing $SP on address bus for memory read
													 oe <= '1'; selAddr <= "010";													 
									when "01" => -- Placing $PTR1 on address bus for memory read
													 oe <= '1'; selAddr <= "011";													 
									when "10" => -- Placing $PTR2 on address bus for memory read
													 oe <= '1'; selAddr <= "100";													 
									when others => -- Placing $PTR3 on address bus for memory read
													 oe <= '1'; selAddr <= "101";													
								 end case;
				when LDI1 => -- Read [$SOURCE] and place in Acc
								 ALUFunc <= "0101"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';								 
				when LDIINC0 => case opcode (1 downto 0) is
										when "00" => -- Placing $SP on address bus for memory read
														 oe <= '1'; selAddr <= "010";														 
										when "01" => -- Placing $PTR1 on address bus for memory read
														 oe <= '1'; selAddr <= "011";														 
										when "10" => -- Placing $PTR2 on address bus for memory read
														 oe <= '1'; selAddr <= "100";														 
										when "11" => -- Placing $PTR3 on address bus for memory read
														 oe <= '1'; selAddr <= "101";														
										when others => ALUFunc <= "0000";
									 end case;
				when LDIINC1 => -- Read [$SOURCE] and place in Acc
								    ALUFunc <= "0101"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';								   
				when LDIINC2 => case opcode (1 downto 0) is
										when "00" => -- Increment $SP 
														 ALUFunc <= "0111"; selB <= "0100"; enSP <= '1';														
										when "01" => -- Increment $PTR1 
														 ALUFunc <= "0111"; selB <= "0101"; enPTR1 <= '1';														 
										when "10" => -- Increment $PTR2 
														 ALUFunc <= "0111"; selB <= "0110"; enPTR2 <= '1';														
										when others => -- Increment $PTR3 
														 ALUFunc <= "0111"; selB <= "0111"; enPTR3 <= '1';														 
									 end case;
				when LDIDEC0 => case opcode (1 downto 0) is
											when "00" => -- Decrement $SP 
															 ALUFunc <= "0011"; selB <= "0100"; selA <= '1'; enSP <= '1';															
											when "01" => -- Decrement $PTR1 
															 ALUFunc <= "0011"; selB <= "0101"; selA <= '1'; enPTR1 <= '1';															
											when "10" => -- Decrement $PTR2 
															 ALUFunc <= "0011"; selB <= "0110"; selA <= '1';  enPTR2 <= '1';															
											when "11" => -- Decrement $PTR3 
															 ALUFunc <= "0011"; selB <= "0111"; selA <= '1'; enPTR3 <= '1';															
											when others => ALUFunc <= "0000";
									 end case;
				when LDIDEC1 => case opcode (1 downto 0) is
										when "00" => -- Placing $SP on address bus for memory read
														 oe <= '1'; selAddr <= "010";														
										when "01" => -- Placing $PTR1 on address bus for memory read
														 oe <= '1'; selAddr <= "011";														 
										when "10" => -- Placing $PTR2 on address bus for memory read
														 oe <= '1'; selAddr <= "100";														
										when others => -- Placing $PTR3 on address bus for memory read
														 oe <= '1'; selAddr <= "101";														
									 end case;
				when LDIDEC2 => -- Read [$SOURCE] and place in Acc
								    ALUFunc <= "0101"; selB <= "0001"; enPSW <= '1'; enAcc <= '1';								   
				when RT0 => -- Placing $SP on address bus for memory read
								oe <= '1'; selAddr <= "010";								
				when RT1 => -- Read [$SP] and place in PC
								ALUFunc <= "0101"; selB <= "0001"; enPC <= '1';								
				when RT2 => -- Increment $SP 
								ALUFunc <= "0111"; selB <= "0100"; enSP <= '1';								
				when RTI0 => -- Placing $SP on address bus for memory read
								 oe <= '1'; selAddr <= "010";								
				when RTI1 => -- Read [$SP] and place in PC
								 ALUFunc <= "0101"; selB <= "0001"; enPC <= '1';								
				when RTI2 => -- Increment $SP 
								 ALUFunc <= "0111"; selB <= "0100"; enSP <= '1';								 
				when RTI3 => -- Enable global interrupt $IEN (8)
								 enIEN <= '1';
								 selIENin <= '1';
								 IENout(8) <= '1';
				when STRR0 => -- store $Acc in $Source
								  case opcode (2 downto 0) is
										when "000" => -- Load $Acc to $SP
													     ALUFunc <= "0100";  enSP <= '1';													     
										when "001" => -- Load $Acc to $PTR1
													     ALUFunc <= "0100"; enPTR1 <= '1';									 				     
										when "010" => -- Load $Acc to $PTR2
													     ALUFunc <= "0100"; enPTR2 <= '1';													     
										when "011" => -- Load $Acc to $PTR3
														  ALUFunc <= "0100"; enPTR3 <= '1';														  
										when "100" => -- Load $Acc to $PSW
													     ALUFunc <= "0100"; enPSW <= '1';	
														  selPSWin <= '1';
										when "101" => -- Load $Acc to $IEN
													     ALUFunc <= "0100"; enIEN <= '1';													     
										when "110" => -- Load $Acc to $IFLAG
													     ALUFunc <= "0100"; enIFLAG <= '1';	
														  selIFLAGin <= '0';
										when others => ALUFunc <= "0000";
									end case;	
				when STRI0 => case opcode (1 downto 0) is
										when "00" => -- Storing $Acc at [$SP]
														 we <= '1'; ALUFunc <= "0100"; selAddr <= "010"; enRes <= '1';														
										when "01" => -- Storing $Acc at [$PTR1]
														 we <= '1'; ALUFunc <= "0100"; selAddr <= "011"; enRes <= '1';														
										when "10" => -- Storing $Acc at [$PTR2]
														 we <= '1'; ALUFunc <= "0100"; selAddr <= "100"; enRes <= '1';														
										when "11" => -- Storing $Acc at [$PTR3]
														 we <= '1'; ALUFunc <= "0100"; selAddr <= "101"; enRes <= '1';														
										when others => ALUFunc <= "0000";
									 end case;
				when STRIINC0 => case opcode (1 downto 0) is
											when "00" => -- Storing $Acc at [$SP]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "010"; enRes <= '1';															
											when "01" => -- Storing $Acc at [$PTR1]
														    we <= '1'; ALUFunc <= "0100"; selAddr <= "011"; enRes <= '1';															 
											when "10" => -- Storing $Acc at [$PTR2]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "100"; enRes <= '1';															
											when others => -- Storing $Acc at [$PTR3]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "101"; enRes <= '1';															 
									  end case;
				when STRIINC1 => case opcode (1 downto 0) is
											when "00" => -- Increment $SP 
														    ALUFunc <= "0111"; selB <= "0100"; enSP <= '1';															 
											when "01" => -- Increment $PTR1 
														    ALUFunc <= "0111"; selB <= "0101"; enPTR1 <= '1';															
											when "10" => -- Increment $PTR2 
														    ALUFunc <= "0111"; selB <= "0110"; enPTR2 <= '1';															
											when others => -- Increment $PTR3 
															 ALUFunc <= "0111"; selB <= "0111"; enPTR3 <= '1';															 											
									 end case;
				when STRIDEC0 => case opcode (1 downto 0) is
											when "00" => -- Decrement $SP 
															 ALUFunc <= "0011"; selB <= "0100"; selA <= '1'; enSP <= '1';
											when "01" => -- Decrement $PTR1 
															 ALUFunc <= "0011"; selB <= "0101"; selA <= '1'; enPTR1 <= '1';															
											when "10" => -- Decrement $PTR2 
															 ALUFunc <= "0011"; selB <= "0110"; selA <= '1';  enPTR2 <= '1';															
											when others => -- Decrement $PTR3 
															 ALUFunc <= "0011"; selB <= "0111"; selA <= '1'; enPTR3 <= '1';															 
									  end case;
				when STRIDEC1 => case opcode (1 downto 0) is
											when "00" => -- Storing $Acc at [$SP]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "010"; enRes <= '1';															 
											when "01" => -- Storing $Acc at [$PTR1]
														    we <= '1'; ALUFunc <= "0100"; selAddr <= "011"; enRes <= '1';															 
											when "10" => -- Storing $Acc at [$PTR2]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "100"; enRes <= '1';															 
											when others => -- Storing $Acc at [$PTR3]
															 we <= '1'; ALUFunc <= "0100"; selAddr <= "101"; enRes <= '1';																										
									  end case;
				when JMP0 => -- Load $IR to $PC
								 ALUFunc <= "0101"; selB <= "0011"; enPC <= '1';								 
				when BZ0 => if (PSW(0) = '1') then
									-- Load $IR to $PC
								   ALUFunc <= "0101"; selB <= "0011"; enPC <= '1';								   
								else
									ALUFunc <= "0000";
								end if;
				when BN0 => if (PSW(1) = '1') then
									-- Load $IR to $PC
								   ALUFunc <= "0101"; selB <= "0011"; enPC <= '1';								 
								else
									ALUFunc <= "0000";
								end if;
				when CL0 => -- Decrement $SP
								ALUFunc <= "0011"; selB <= "0100"; selA <= '1'; enSP <= '1';								
				when CL1 => -- Here the $PC is not incrementing before storing at [$SP] as the PC is 
								-- already pointing to next instr. incrementing happening at dcd state								
								we <= '1'; ALUFunc <= "0101"; selAddr <= "010"; selB <= "0010"; enRes <= '1';
				when CL2 => -- Load $IR to $PC
								ALUFunc <= "0101"; selB <= "0011"; enPC <= '1';	
				when INTR1 => -- LOAD IR with intrpt1 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "001";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(1) <= '0';
				when INTR2 => -- LOAD IR with intrpt2 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "010";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(2) <= '0';
				when INTR3 => -- LOAD IR with intrpt3 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "011";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(3) <= '0';
				when INTR4 => -- LOAD IR with intrpt4 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "100";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(4) <= '0';
				when INTR5 => -- LOAD IR with intrpt5 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "101";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(5) <= '0';
				when INTR6 => -- LOAD IR with intrpt6 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "110";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(6) <= '0';
				when INTR7 => -- LOAD IR with intrpt7 location, disable global interrupt
								  -- and respective flag
								  selIRin <= "111";
								  enIFLAG <= '1';
								  enIEN <= '1';
								  enIR <= '1';
								  selIFLAGin <= '1';
								  selIENin <= '1';
								  IENout(8) <= '0';
								  IFLAGout(7) <= '0';
				when others => ALUFunc <= "0000";
			end case;
	end process;

end Behavioral;

