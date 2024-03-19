----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 10:03:58 PM
-- Design Name: 
-- Module Name: TB_D_FF - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is

component D_FF
    port( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

SIGNAL D,Res,Clk : STD_LOGIC;
SIGNAL Q, Qbar : STD_LOGIC;


begin

UUT : D_FF PORT MAP(
    D=>D,
    Res=>Res,
    Clk=>Clk,
    Q=>Q,
    Qbar=>Qbar
);

process 
begin
    Clk<='1';
    wait for 100 ns;
    
    Clk<='0';
    wait for 100 ns;
end process;


process 
begin 
    D <= '1';
    Res <= '1';
    wait for 100 ns;

    D <= '0';
    Res <='0';
    wait for 100 ns;
    
    D <= '1';
    wait for 100 ns;
    
    D <= '0';
    wait for 100 ns;
    
    wait;
    
end process;
end Behavioral;
