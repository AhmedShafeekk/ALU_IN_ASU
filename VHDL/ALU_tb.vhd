--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:13:55 04/24/2022
-- Design Name:   
-- Module Name:   E:/Materials/2nd ECE/2nd term/Digital Circuits/Slides/Project/VHDL/ALU_IN_ASU/ALU_tb.vhd
-- Project Name:  ALU_IN_ASU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          sel => sel,
          y => y
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
      begin		
--		   a<="1011";
--			b<="0110";
--			wait for 100 ns;
--			sel<="0001";
--		   wait for 100 ns;
--			sel<="0010";
--			wait for 100 ns;
--			sel<="0011";
--			wait for 100 ns;
--			sel<="0100";
--			wait for 100 ns;
--			sel<="0101";
--			wait for 100 ns;
--			sel<="0110";
--			wait for 100 ns;
--			sel<="0111";
			
			a<= "0000";
			b<="0000";
			sel<="0000";
			wait for 100 ns;
			for i in 0 to 15 loop
					for ii in 0 to 15 loop
							for iii in 0 to 15 loop
								b<=std_logic_vector(unsigned(b)+1);
								  wait for 100 ns;
									 end loop;
									   a<=std_logic_vector(unsigned(a)+1);
									     end loop;
			 sel <=std_logic_vector(unsigned(sel)+1);
			 a<="0000";
			 b<="0000";
			 wait for 100 ns;
			 end loop;
   end process;
END;