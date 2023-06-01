LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY mux2para114 IS
GENERIC (N :POSITIVE:= 14);

PORT (a, b : IN std_logic_vector (N-1 DOWNTO 0);
sel : IN std_logic;
y : OUT std_logic_vector (N - 1 DOWNTO 0));

END mux2para114;

ARCHITECTURE arch OF mux2para114 IS
BEGIN

y <= a when sel = '0' else
b;
END arch;