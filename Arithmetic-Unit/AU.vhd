----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 04:24:01 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is

component Slow_Clk
    port( Clk_in : in STD_LOGIC;
          Clk_out : out STD_LOGIC);

end component;
component Reg
    port(
        D : in STD_LOGIC_VECTOR(3 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component RCA_4
        port (
            A0 : in STD_LOGIC;
            A1 : in STD_LOGIC;
            A2 : in STD_LOGIC;
            A3 : in STD_LOGIC;
            B0 : in STD_LOGIC;
            B1 : in STD_LOGIC;
            B2 : in STD_LOGIC;
            B3 : in STD_LOGIC;
            C_in : in STD_LOGIC;
            S0 : out STD_LOGIC;
            S1 : out STD_LOGIC;
            S2 : out STD_LOGIC;
            S3 : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
end component;


signal Dec_out_0 :std_logic; --first output of the 1 to 2 decoder
signal Dec_out_1 :std_logic; --second output of the 1 to 2 decoder

signal Q_A,Q_B : STD_LOGIC_VECTOR (3 downto 0);

signal S0,S1,S2,S3 : STD_LOGIC; 
signal S0_out,S1_out : STD_LOGIC_VECTOR (3 downto 0); 

signal S_RCA : STD_LOGIC_VECTOR (3 downto 0);
signal slow_clock :STD_LOGIC;
signal C_out : STD_LOGIC;

begin


Dec_out_0<= RegSel;
Dec_out_1<= NOT(RegSel);

Slow_Clk_0 :Slow_Clk
    port map(
    CLK_in=>Clk,
    Clk_out=>slow_clock
    );
Reg_A : Reg
    port map(
        D=>A,
        En=>Dec_out_0,
        Clk=>slow_clock,
        Q=>Q_A);
       
Reg_B : Reg
    port map(
        D=>A,
        En=>Dec_out_1,
        Clk=>slow_clock,
        Q=>Q_B); 
        
RCA : RCA_4
    port map(
        A0=>Q_A(0),
        A1=>Q_A(1),
        A2=>Q_A(2),
        A3=>Q_A(3),
        B0=>Q_B(0),
        B1=>Q_B(1),
        B2=>Q_B(2),
        B3=>Q_B(3),
        C_in=>'0',
        S0=>S_RCA(0),
        S1=>S_RCA(1),
        S2=>S_RCA(2),
        S3=>S_RCA(3),
        C_out=>C_out
    );    
    Carry<=C_out;
    S<=S_RCA;
    Zero<=(NOT S_RCA(0)) AND (NOT S_RCA(1)) AND (NOT S_RCA(2)) AND (NOT S_RCA(3)) AND (NOT C_out);
 
   

end Behavioral;
