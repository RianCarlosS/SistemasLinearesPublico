library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Sum10 is
port (A: in std_logic_vector(8 downto 0);
B: in std_logic_vector(8 downto 0);
F: out std_logic_vector(9 downto 0)
);
end Sum10;
architecture circuito of Sum10 is
signal c1, c2, c3, c4, c5, c6, c7, c8: std_logic;


component somador1bit IS
    PORT (cin, a, b : IN STD_LOGIC;
                 s, cout : OUT STD_LOGIC);
END component ;

begin

su0: somador1bit port map ('0', A(0), B(0), F(0), c1);
su1: somador1bit port map (c1, A(1), B(1), F(1), c2);
su2: somador1bit port map (c2, A(2), B(2), F(2), c3);
su3: somador1bit port map (c3, A(3), B(3), F(3), c4);
su4: somador1bit port map (c4, A(4), B(4), F(4), c5);
su5: somador1bit port map (c5, A(5), B(5), F(5), c6);
su6: somador1bit port map (c6, A(6), B(6), F(6), c7);
su7: somador1bit port map (c7, A(7), B(7), F(7), c8);
su8: somador1bit port map (c8, A(8), B(8), F(8), F(9));

end circuito;