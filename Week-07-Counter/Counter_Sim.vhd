----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 11:24:30 AM
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is
component Counter
    port(
        Dir : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

--SIGNAL Clk_in : std_logic;
--SIGNAL Clk_out : std_logic;

signal Clk : STD_LOGIC:='0';
signal Res, Dir: STD_LOGIC;
signal Q:STD_LOGIC_VECTOR (2 downto 0);


begin

UUT: COunter 
    PORT MAP (
        Dir=>Dir,
        Res=>Res,
        Clk=>Clk,
        Q=>Q
    );
    
process 
begin 
    Clk<=NOT(Clk);
    wait for 5 ns;
end process;

process
begin

    Res <='1';
    wait for 100 ns;
    
    Dir <='0';
    Res <='0';
    
    wait for 600ns;
    Dir <='1';
    wait;
    
end process;

end Behavioral;
