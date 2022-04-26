library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is port(
			a: in std_logic_vector (3 downto 0);
			b: in std_logic_vector (3 downto 0);
			sel: in std_logic_vector (3 downto 0);
			y: out std_logic_vector (4 downto 0)
);
end ALU;

Architecture DataFlow of ALU is 
			signal a4: std_logic_vector(4 downto 0);
			signal b4: std_logic_vector(4 downto 0);
			signal Arithmetic: std_logic_vector (4 downto 0);
			signal Logical: std_logic_vector (3 downto 0);

begin 
            a4<=a(3)&a;
				b4<=b(3)&b;   
	
------------------------------ARITHMETIC OPERATIONS---------------------------------
			with sel(2 downto 0) select
					Arithmetic<= 	std_logic_vector(signed(a4)+1) when "000",	
										std_logic_vector(signed(a4)-1) when "001",
										std_logic_vector(signed(b4)) when "010",
										std_logic_vector(signed(b4)+1) when "011",
										std_logic_vector(signed(b4)-1) when "100",
										std_logic_vector(signed(a4)) when "101",
										std_logic_vector(signed(a4)+signed(b4)) when "110",
										a4(3 downto 0) &'0' when others;
									
------------------------------LOGICAL OPERATIONS-------------------------------------
			with sel(2 downto 0) select
						Logical<=  not(a) when "000",
						           not(b) when "001",
								     a and b when "010",
								     a or b when "011",
								     a xor b when "100",
								     a xnor b when "101",
								     a nand b when "110",
								     a nor b when others;
									  
-------------------------------------MUX-----------------------------------------------------
				with sel(3) select 
								y<= Arithmetic when '0',
									 '0'&Logical when others;
end DataFlow;