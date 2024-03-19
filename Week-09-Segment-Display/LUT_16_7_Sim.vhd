----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2024 10:02:21 AM
-- Design Name: 
-- Module Name: LUT_16_7_Sim - Behavioral
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

entity LUT_16_7_Sim is
--  Port ( );
end LUT_16_7_Sim;

architecture Behavioral of LUT_16_7_Sim is

component LUT_16_7
    port(
        address : in STD_LOGIC_VECTOR(3 downto 0);
        data : out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal address : STD_LOGIC_VECTOR(3 downto 0);
signal data : STD_LOGIC_VECTOR(6 downto 0);

begin
UUT : LUT_16_7
    port map(
    address=>address,
    data=>data
    );
process 
begin 
-- index num 11 0101 1101 0011 0101 (220469P)
    address <= "0101"; 
    wait for 100 ns;
    
    address <= "0011"; 
    wait for 100 ns;
    
    address <= "1101";
    wait for 100 ns;
    
    address <= "0100"; 
    wait for 100 ns;

    address <= "0000"; 
    wait for 100 ns;
    
    address <= "0001"; 
    wait for 100 ns;
    
    address <= "0010"; 
    wait for 100 ns;
end process;
end Behavioral;
