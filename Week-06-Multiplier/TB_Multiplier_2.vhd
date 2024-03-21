----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MRS Perera
-- 
-- Create Date: 02/27/2024 03:00:38 PM
-- Design Name: 
-- Module Name: TB_Multiplier_2 - Behavioral
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

entity TB_Multiplier_2 is
--  Port ( );
end TB_Multiplier_2;

architecture Behavioral of TB_Multiplier_2 is

component Multiplier_2
    port (A : in STD_LOGIC_VECTOR (1 downto 0);
          B : in STD_LOGIC_VECTOR (1 downto 0);
          Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,B :STD_LOGIC_VECTOR (1 downto 0);
signal Y :STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Multiplier_2 PORT MAP (
    A=>A,
    B=>B,
    Y=>Y
);
-- 11 01 10 00 01 10 01 01 01 

process 
begin 

    A<="01";
    B<="01";
    
    WAIT FOR 100 ns;
    A<="01";
    B<="10";
    
    WAIT FOR 100 ns;
    A<="01";
    B<="00";
    
    WAIT FOR 100 ns;
    A<="10";
    B<="01";
    WAIT;

end process;

end Behavioral;
