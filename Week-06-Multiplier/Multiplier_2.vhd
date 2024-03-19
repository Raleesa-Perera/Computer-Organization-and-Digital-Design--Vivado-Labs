----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MRS Perera
-- 
-- Create Date: 02/27/2024 02:14:39 PM
-- Design Name: 
-- Module Name: Multiplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is

component FA is
    port(
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic
    );
end component;

signal b0a0, b0a1, b1a0, b1a1 : std_logic;
signal s_0_0, s_0_1, c_0_0, c_0_1 : std_logic;

begin

b0a0 <= A(0) AND B(0);
b0a1 <= A(1) AND B(0);
b1a0 <= A(0) AND B(1);
b1a1 <= A(1) AND B(1);

Y(0) <= b0a0;


FA_0_0 : FA 
port map(
    A=>b0a1,
    B=>b1a0,
    C_in=> '0',
    S=> Y(1),
    C_out=> c_0_0
);

FA_0_1 : FA 
port map(
    A=>'0',
    B=>b1a1,
    C_in=> c_0_0,
    S=> Y(2),
    C_out=> Y(3)
);


end Behavioral;
