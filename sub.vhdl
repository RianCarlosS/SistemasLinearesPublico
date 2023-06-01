library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity Sub is
port (A: in std_logic_vector(7 downto 0);
B: in std_logic_vector(7 downto 0);
F: out std_logic_vector (7 downto 0)
);
end Sub;
architecture circuito of Sub is
begin
F <= A - B;
end circuito;