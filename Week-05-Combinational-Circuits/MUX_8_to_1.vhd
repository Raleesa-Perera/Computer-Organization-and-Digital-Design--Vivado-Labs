----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2024 07:48:56 PM
-- Design Name: 
-- Module Name: MUX_8_to_1 - Behavioral
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

entity MUX_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is

component Decoder_3_to_8 is 
    port( 
        I : in STD_LOGIC_VECTOR(2 downto 0); 
        EN : in STD_LOGIC; 
        Y : out STD_LOGIC_VECTOR(7 downto 0)); 
    end component; 
     
    signal d_out : STD_LOGIC_VECTOR(7 downto 0); 
                                                                                                                                                                                                                                                                
signal out_1 : std_logic;     
signal out_2 : std_logic; 
signal out_3 : std_logic; 
signal out_4 : std_logic; 
signal out_5 : std_logic; 
signal out_6 : std_logic; 
signal out_7 : std_logic; 
signal out_8 : std_logic; 

begin

Decoder : Decoder_3_to_8 
        port map( 
            I=>S, 
            EN =>EN, 
            Y => d_out 
        ); 
         
         
    out_1 <= d_out(0) AND D(0); 
    out_2 <= d_out(1) AND D(1); 
    out_3 <= d_out(2)AND D(2); 
    out_4 <= d_out(3)AND D(3); 
    out_5 <= d_out(4) AND D(4); 
    out_6 <= d_out(5) AND D(5); 
    out_7 <= d_out(6) AND D(6); 
    out_8 <= d_out(7) AND D(7); 
    Y <= (out_1 OR out_2 OR out_3 OR out_4 OR out_5 OR out_6 OR out_7 OR out_8) AND EN; 

end Behavioral;
