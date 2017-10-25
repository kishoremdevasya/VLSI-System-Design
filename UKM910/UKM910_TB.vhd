--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:42 06/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Kishore/Documents/MS/IMTEK/ILIAS/SS 2017/VLSI System Design/Project/code base/UKM910/UKM910_TB.vhd
-- Project Name:  UKM910
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UKM910
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY UKM910_TB IS
END UKM910_TB;
 
ARCHITECTURE behavior OF UKM910_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UKM910
    PORT(
         clk : IN  std_logic;
         res : IN  std_logic;
         interrupts : IN  std_logic_vector(7 downto 0);
         oe : OUT  std_logic;
         wren : OUT  std_logic;
         addressbus : OUT  std_logic_vector(11 downto 0);
         databus : INOUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT memory
	 PORT(
			clk : IN std_logic;
			addr : IN std_logic_vector(10 downto 0);
			wren : IN std_logic;
			oe : IN std_logic;       
			dataIO : INOUT std_logic_vector(15 downto 0)
		 );
	END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal res : std_logic := '0';
   signal interrupts : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal databus : std_logic_vector(15 downto 0);

 	--Outputs
   signal oe : std_logic;
   signal wren : std_logic;
   signal addressbus : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UKM910 PORT MAP (
          clk => clk,
          res => res,
          interrupts => interrupts,
          oe => oe,
          wren => wren,
          addressbus => addressbus,
          databus => databus
        );

   
	mem: memory PORT MAP(
		clk => clk,
		addr => addressbus(10 downto 0),
		dataIO => databus,
		wren => wren,
		oe => oe 
	);
	
	createReset : PROCESS 
	BEGIN
		res <= '1';
		WAIT FOR 150 ns;
		res <= '0';
		WAIT;
	END PROCESS createReset;
	
	createClock : PROCESS
	BEGIN
		clk <= '0';
		WAIT FOR 100 ns;
		clk <= '1';
		WAIT FOR 100 ns;
	END PROCESS createClock;

END;
