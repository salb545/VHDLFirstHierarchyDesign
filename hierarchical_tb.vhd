-- Testbench 
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component Four_Bit_Adder is
port(	
			       a : in  STD_LOGIC_VECTOR (3 downto 0);
	           b : in  STD_LOGIC_VECTOR (3 downto 0);
	           cin : in  STD_LOGIC;
	           s : out  STD_LOGIC_VECTOR (3 downto 0);
	           cout : out  STD_LOGIC);
               
end component;
-- INPUTS --
signal a : std_logic_vector(3 downto 0) := "0000";
signal b : std_logic_vector(3 downto 0) := "0000";
signal cin : std_logic := '0';
--signal cin;

-- OUTPUTS --
signal s : std_logic_vector(3 downto 0);
signal cout : std_logic := '0';
--signal cout;

begin

  -- Connect UUT
 uut: Four_Bit_Adder PORT MAP (
 a => a,
 b => b,
 cin => cin,
 s => s,
 cout => cout 
 );

  PROCESS
  begin

	 a <= "0000";
   b <= "0000";
   cin <= '0';
   wait for 1 ns;
   assert(s="0000") report "Fail, SHOULD BE S = 0000" severity error;


   a <= "0001";
   b <= "0000";
   cin <= '0';
   wait for 1 ns;
   assert(s="0001") report "Fail, SHOULD BE S = 0001 " severity error;
   
         
   a <= "0000";
   b <= "0001";
   cin <= '0';
   wait for 1 ns;
   assert(s="0001") report "Fail, SHOULD BE S = 0001 " severity error;
   
   a <= "0001";
   b <= "0001";
   cin <= '0';
   wait for 1 ns;
   assert(s="0010") report "Fail, SHOULD BE S = 0010 " severity error;
   
   
   a <= "0010";
   b <= "0001";
   cin <= '0';
   wait for 1 ns;
   assert(s="0011") report "Fail, SHOULD BE S = 0011 " severity error;
   
   a <= "0001";
   b <= "0001";
   cin <= '1';
   wait for 1 ns;
   --SHOULD BE 3 OUTPUT;
   
   a <= "0011";
   b <= "0011";
   cin <= '0';
   wait for 1 ns;
   
   a <= "0101";
   b <= "0101";
   cin <= '0';
   wait for 1 ns;
  -- Should be 5
  
   a <= "1000";
   b <= "1000";
   cin <= '0';
   wait for 1 ns;
   --SHOULD BE 16 OUTPUT;     
   assert false report "Test done." severity note;
   
   
   a <= "1000";--8
   b <= "1000";--8
   cin <= '1';--1
   wait for 1 ns;
   --SHOULD BE 17 OUTPUT;     
   assert false report "Test done." severity note;


   a <= "1111";--15
   b <= "1111";--15
   cin <= '0';--1
   wait for 1 ns;
   --SHOULD BE 17 OUTPUT;     
   assert false report "Test done." severity note;


   wait;
  END PROCESS;
end tb;
