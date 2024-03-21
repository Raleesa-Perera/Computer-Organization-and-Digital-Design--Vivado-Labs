----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MRS Perera
-- 
-- Create Date: 02/27/2024 07:59:18 PM
-- Design Name: 
-- Module Name: TB_Multiplier_4 - Behavioral
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is

component Multiplier_4
    port (A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A,B :STD_LOGIC_VECTOR (3 downto 0);
signal Y :STD_LOGIC_VECTOR (7 downto 0);

begin

UUT : Multiplier_4 PORT MAP (
    A=>A,
    B=>B,
    Y=>Y
);
-- 11 0110 0001 1001 0101 
process 
begin 

    A<="0101";
    B<="1001";
    
    WAIT FOR 100 ns;
    A<="0001";
    B<="0110";
    
    -- give some random numbers to simulate
    WAIT FOR 100 ns;
    A<="0010";
    B<="1110";
    
    WAIT FOR 100 ns;
    A<="0011";
    B<="1111";
    
    WAIT FOR 100 ns;
    A<="0011";
    B<="1111";
    
    
    WAIT;

end process;
end Behavioral;
