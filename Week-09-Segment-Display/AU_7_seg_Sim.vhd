----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2024 09:34:27 PM
-- Design Name: 
-- Module Name: AU_7_seg_Sim - Behavioral
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

entity AU_7_seg_Sim is
--  Port ( );
end AU_7_seg_Sim;

architecture Behavioral of AU_7_seg_Sim is

component AU_7_seg
    port(
    A : in STD_LOGIC_VECTOR (3 downto 0);
    Clk : in STD_LOGIC;
    RegSel : in STD_LOGIC;
    S_LED : out STD_LOGIC_VECTOR (3 downto 0);
    S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
    Carry : out STD_LOGIC;
    Zero : out STD_LOGIC
    );
end component;

signal A : STD_LOGIC_VECTOR (3 downto 0);
signal Clk : STD_LOGIC:='0';
signal RegSel : STD_LOGIC;
signal S_LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Carry : STD_LOGIC;
signal Zero : STD_LOGIC;

begin

UUT : AU_7_seg
    port map(
        A=>A,
        Clk=>Clk,
        RegSel=>RegSel,
        S_LED=>S_LED,
        S_7Seg=>S_7Seg,
        Carry=>Carry,
        Zero=>Zero
    );
 
 process  
 begin 
    Clk <=(NOT Clk); 
    wait for 2 ns; 
    
 end process;    
    
process 
begin 
    -- index num 11 0101 1101 0011 0101 (220469P)
    RegSel <= '0'; 
    A <= "0101"; 
    wait for 40 ns; 
    RegSel <= '1'; 
    A <= "0011"; 
    wait for 40 ns; 
    
    RegSel <= '0'; 
    A <= "1101"; 
    wait for 40 ns; 
    RegSel <= '1'; 
    A <= "0101"; 
    wait for 40 ns; 
    
    RegSel <= '0'; 
    A <= "0101"; 
    wait for 40 ns; 
    RegSel <= '1'; 
    A <= "1101"; 
    wait for 40 ns; 
    
    RegSel <= '0'; 
    A <= "0011"; 
    wait for 40 ns; 
    RegSel <= '1'; 
    A <= "0101"; 
    wait for 40 ns;
    
    RegSel <= '0'; 
    A <= "0101"; 
    wait for 40 ns; 
    RegSel <= '1'; 
    A <= "1101"; 
    wait for 40 ns;

    
    
    
end process;
end Behavioral;
