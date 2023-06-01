library ieee;
use ieee.std_logic_1164.all;        
use ieee.numeric_std.all; 

entity absu is
port (  
  entrada: in  std_logic_vector(7 downto 0);
  saida: out std_logic_vector(7 downto 0) 
);
end absu;

architecture circuito of absu is
begin
process(entrada) is
begin
  saida <= std_logic_vector(abs(signed(entrada)));
end process;
 end circuito;