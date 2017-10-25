----------------------------------------------------------------------------------
-- Company: Group 1, VLSI System Design, SS 2017, IMTEK Freiburg
-- Engineer: Kishore Muthukulathu Devasia
-- 
-- Create Date:    13:30:10 06/16/2017 
-- Design Name: 
-- Module Name:    Interrupt_Logger - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- This design will detect the rising edge of interrupt in the external interrupt line of the processor
-- and set the interrupt asynchronous to the system clock
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

entity Interrupt_Logger is
    Port ( intr_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  crtl_intr_clr : in STD_LOGIC_VECTOR (7 downto 0);
           intr_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Interrupt_Logger;

architecture Behavioral of Interrupt_Logger is
	component DFlipFlop is
		 Port ( clk : in  STD_LOGIC;
				  rst : in STD_LOGIC;
				  d : in  STD_LOGIC;
				  q : out  STD_LOGIC);
	end component;
begin
	
	intr8: DFlipFlop port map (clk => intr_in(7), rst => crtl_intr_clr(7), d => '1', q => intr_out(7));
	intr7: DFlipFlop port map (clk => intr_in(6), rst => crtl_intr_clr(6), d => '1', q => intr_out(6));
	intr6: DFlipFlop port map (clk => intr_in(5), rst => crtl_intr_clr(5), d => '1', q => intr_out(5));
	intr5: DFlipFlop port map (clk => intr_in(4), rst => crtl_intr_clr(4), d => '1', q => intr_out(4));
	intr4: DFlipFlop port map (clk => intr_in(3), rst => crtl_intr_clr(3), d => '1', q => intr_out(3));
	intr3: DFlipFlop port map (clk => intr_in(2), rst => crtl_intr_clr(2), d => '1', q => intr_out(2));
	intr2: DFlipFlop port map (clk => intr_in(1), rst => crtl_intr_clr(1), d => '1', q => intr_out(1));
	intr1: DFlipFlop port map (clk => intr_in(0), rst => crtl_intr_clr(0), d => '1', q => intr_out(0));

end Behavioral;

