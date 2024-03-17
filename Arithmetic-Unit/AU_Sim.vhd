library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AU_Sim is
--  Port ( );
end AU_Sim;

architecture Behavioral of AU_Sim is

component AU
    port (
        RegSel : in STD_LOGIC;
        Clk : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_VECTOR (3 downto 0);
        Zero :out STD_LOGIC;
        Carry : out STD_LOGIC);
end component;

SIGNAL RegSel : STD_LOGIC;
SIGNAL Clk : STD_LOGIC:='0';
SIGNAL A : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL S: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Zero : STD_LOGIC;
SIGNAL Carry : STD_LOGIC;
begin



UUT: AU PORT MAP(
    A=>A,
    RegSel=>RegSel,
    Clk=>Clk,
    Zero=>Zero,
    Carry=>Carry,
    S=>S
    );
    
process 
begin
    Clk <=(NOT Clk);
    wait for 2 ns;
end process;


process
begin
-- 11 0101 1101 1001 1101
    RegSel <= '0';
    A <= "1101";
    wait for 40 ns;
    RegSel <= '1';
    A <= "1001";
    wait for 40 ns;
    
    RegSel <= '0';
    A <= "1001";
    wait for 40 ns;
    RegSel <= '1';
    A <= "1101";
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
    A <= "0011";
    wait for 40 ns;
    
  

end process;

end Behavioral;
