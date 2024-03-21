----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MRS Perera
-- 
-- Create Date: 02/27/2024 03:40:59 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

component FA is
    port(
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic
    );
end component;

signal a0b0, a0b1, a0b2, a0b3 : std_logic;
signal a1b0, a1b1, a1b2, a1b3 : std_logic;
signal a2b0, a2b1, a2b2, a2b3 : std_logic;
signal a3b0, a3b1, a3b2, a3b3 : std_logic;

signal c_0_0, c_0_1, c_0_2, c_0_3 : std_logic;
signal c_1_0, c_1_1, c_1_2, c_1_3 : std_logic;
signal c_2_0, c_2_1, c_2_2, c_2_3 : std_logic;
signal c_3_0, c_3_1, c_3_2, c_3_3 : std_logic;

signal s_0_1, s_0_2, s_0_3 : std_logic;
signal s_1_1, s_1_2, s_1_3 : std_logic;

begin

a0b0 <= A(0) AND B(0);
a0b1 <= A(0) AND B(1);
a0b2 <= A(0) AND B(2);
a0b3 <= A(0) AND B(3);

a1b0 <= A(1) AND B(0);
a1b1 <= A(1) AND B(1);
a1b2 <= A(1) AND B(2);
a1b3 <= A(1) AND B(3);

a2b0 <= A(2) AND B(0);
a2b1 <= A(2) AND B(1);
a2b2 <= A(2) AND B(2);
a2b3 <= A(2) AND B(3);

a3b0 <= A(3) AND B(0);
a3b1 <= A(3) AND B(1);
a3b2 <= A(3) AND B(2);
a3b3 <= A(3) AND B(3);

Y(0) <= a0b0;

FA_0_0 : FA 
port map(
    A=>a1b0,
    B=>a0b1,
    C_in=> '0',
    S=> Y(1),
    C_out=> c_0_0
);

FA_0_1 : FA 
port map(
    A=>a1b1,
    B=>a0b2,
    C_in=>c_0_0,
    S=> s_0_1,
    C_out=> c_0_1
);

FA_0_2 : FA 
port map(
    A=>a1b2,
    B=>a0b3,
    C_in=>c_0_1,
    S=> s_0_2,
    C_out=> c_0_2
);

FA_0_3 : FA 
port map(
    A=>a1b3,
    B=>'0',
    C_in=>c_0_2,
    S=> s_0_3,
    C_out=> c_0_3
);

FA_1_0 : FA 
port map(
    A=>a2b0,
    B=>s_0_1,
    C_in=>'0',
    S=>Y(2),
    C_out=> c_1_0
);

FA_1_1 : FA 
port map(
    A=>a2b1,
    B=>s_0_2,
    C_in=>c_1_0,
    S=>s_1_1,
    C_out=> c_1_1
);

FA_1_2 : FA 
port map(
    A=>a2b2,
    B=>s_0_3,
    C_in=>c_1_1,
    S=>s_1_2,
    C_out=> c_1_2
);

FA_1_3 : FA 
port map(
    A=>a2b3,
    B=>c_0_3,
    C_in=>c_1_2,
    S=>s_1_3,
    C_out=> c_1_3
);

FA_2_0 : FA 
port map(
    A=>a3b0,
    B=>s_1_1,
    C_in=>'0',
    S=>Y(3),
    C_out=> c_2_0
);

FA_2_1 : FA 
port map(
    A=>a3b1,
    B=>s_1_2,
    C_in=>c_2_0,
    S=>Y(4),
    C_out=> c_2_1
);

FA_2_2 : FA 
port map(
    A=>a3b2,
    B=>s_1_3,
    C_in=>c_2_1,
    S=>Y(5),
    C_out=> c_2_2
);

FA_2_3 : FA 
port map(
    A=>a3b3,
    B=>c_1_3,
    C_in=>c_2_2,
    S=>Y(6),
    C_out=> Y(7)
);

end Behavioral;
