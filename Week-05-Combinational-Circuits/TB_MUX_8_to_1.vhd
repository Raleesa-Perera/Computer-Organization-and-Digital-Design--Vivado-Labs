----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2024 08:10:52 PM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_MUX_8_to_1 is
--  Port ( );
end TB_MUX_8_to_1;

architecture Behavioral of TB_MUX_8_to_1 is

COMPONENT MUX_8_to_1 
PORT(S : in STD_LOGIC_VECTOR (2 downto 0); 
    D : in STD_LOGIC_VECTOR (7 downto 0); 
    EN : in STD_LOGIC; 
    Y : out STD_LOGIC); 
END COMPONENT; 

SIGNAL S : STD_LOGIC_VECTOR (2 downto 0); 
SIGNAL D : STD_LOGIC_VECTOR (7 downto 0); 
SIGNAL EN :STD_LOGIC; 
SIGNAL Y : STD_LOGIC; 

begin

UUT: MUX_8_to_1 PORT MAP( 
S=>S, 
D=>D, 
EN=>EN, 
Y=>Y 
 ); 
 -- 110 110 000 110 010 101 
process 
begin 
    EN<='1'; 
    D<= "10010101"; 
    S<="000"; 
     
    WAIT FOR 100 ns; 
    S<="001"; 
     
    WAIT FOR 100 ns; 
    S<="010"; 
    
    WAIT FOR 100 ns; 
    S<="011"; 
     
    WAIT FOR 100 ns; 
    S<="100"; 
     
    WAIT FOR 100 ns; 
    S<="101"; 
  
    WAIT FOR 100 ns; 
    S<="110"; 
     
    WAIT FOR 100 ns; 
    S<="111"; 
WAIT; 
end process;   


end Behavioral;
