----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 12:08:31 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is

component D_FF 
port (
     D : in STD_LOGIC; 
     Res: in STD_LOGIC; 
     Clk : in STD_LOGIC; 
     Q : out STD_LOGIC; 
     Qbar : out STD_LOGIC); 
end component;

component Slow_Clk 
    port (   
        Clk_in : in STD_LOGIC; 
        Clk_out: out STD_LOGIC);   
end component;
    
signal D0, D1, D2 : std_logic;  -- Internal signals 
signal Q0, Q1, Q2 : std_logic; -- Internal signals 
signal Clk_slow : std_logic; -- Internal clock 


begin

Slow_Clk0 : Slow_Clk 
    port map (   
    Clk_in => Clk, 
    Clk_out => Clk_slow); 
    
    
     D0 <= ((not Q2) and (not Dir)) or (Q1 and Dir); 
     D1 <= ((Q2 AND Dir) or (Q0 and(NOT Dir)));
     D2 <= ((Q1 AND (NOT (Dir)) AND Q0) OR (NOT (Q0) AND (Q1 OR Dir)));
     
     
     D_FF0 : D_FF 
        port map (   
        D => D0, 
        Res => Res, 
        Clk => Clk_slow,   
        Q => Q0);  
     
     D_FF1 : D_FF 
        port map (
        D => D1, 
        Res => Res, 
        Clk => Clk_slow,   
        Q => Q1);   
            
     D_FF2 : D_FF 
        port map (
        D => D2, 
        Res => Res, 
        Clk => Clk_slow,   
        Q => Q2);  
        
        Q(0) <= Q0;
        Q(1) <= Q1;
        Q(2) <= Q2;
       
 

end Behavioral;
