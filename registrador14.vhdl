LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY registrador14 IS GENERIC (N : INTEGER := 14);

PORT( clk, rst, carga: IN STD_LOGIC;
D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) 
);
END registrador14;
ARCHITECTURE comportamento OF registrador14 IS
BEGIN
PROCESS (rst, clk)
BEGIN
IF (rst= '1') THEN
Q <=(OTHERS => '0');
ELSIF (rising_edge(clk)) THEN
IF (carga = '1') THEN Q <= D;
END IF;
END IF;
END PROCESS;
END comportamento;