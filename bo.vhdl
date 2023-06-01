library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity bo is
port ( zi, ci, cpa, cpb, zsoma, csoma, csad_reg, ck, reset: in std_logic;
menor: out std_logic;

A, B: in std_logic_vector(31 downto 0);
Saida: out std_logic_vector (13 downto 0);
endereco: out std_logic_vector (3 downto 0)

);
end bo;
architecture circuito of bo is
signal pA, pB, subi, absi, subi1, absi1, subi2, absi2, subi3, absi3, pA1, pB1, pA2, pB2, pA3, pB3 : std_logic_vector (7 downto 0);
signal sum14, mux14, soma: std_logic_vector (13 downto 0);
signal mux7, i, voltinha: std_logic_vector (4 downto 0);
signal sum19, sum29: std_logic_vector (8 downto 0);
signal sumf: std_logic_vector (9 downto 0);


component Sum is
port (A: in std_logic_vector(4 downto 0);
B: in std_logic_vector(4 downto 0);
F: out std_logic_vector(4 downto 0)
);
end component;

component mux2para1 IS
GENERIC (N :POSITIVE:= 5);

PORT (a, b : IN std_logic_vector (N-1 DOWNTO 0);
sel : IN std_logic;
y : OUT std_logic_vector (N - 1 DOWNTO 0));

END component;

component registrador IS GENERIC (N : INTEGER := 8);

PORT( clk, rst, carga: IN STD_LOGIC;
D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) 
);
END component;

component registrador7 IS GENERIC (N : INTEGER := 5);

PORT( clk, rst, carga: IN STD_LOGIC;
D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) 
);
END component;

component registrador14 IS GENERIC (N : INTEGER := 14);

PORT( clk, rst, carga: IN STD_LOGIC;
D : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
Q: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) 
);
END component;

component mux2para114 IS
GENERIC (N :POSITIVE:= 14);

PORT (a, b : IN std_logic_vector (N-1 DOWNTO 0);
sel : IN std_logic;
y : OUT std_logic_vector (N - 1 DOWNTO 0));

END component;

component Sum13 is
port (A: in std_logic_vector(13 downto 0);
B: in std_logic_vector(13 downto 0);
F: out std_logic_vector (13 downto 0)
);
end component;

component Sub is
port (A: in std_logic_vector(7 downto 0);
B: in std_logic_vector(7 downto 0);
F: out std_logic_vector (7 downto 0)
);
end component;

component absu is
port (  
  entrada: in  std_logic_vector(7 downto 0);
  saida: out std_logic_vector(7 downto 0) 
);
end component;

component Sum9 is
port (A: in std_logic_vector(7 downto 0);
B: in std_logic_vector(7 downto 0);
F: out std_logic_vector(8 downto 0)
);
end component;

component Sum10 is
port (A: in std_logic_vector(8 downto 0);
B: in std_logic_vector(8 downto 0);
F: out std_logic_vector(9 downto 0)
);
end component;


begin 

pA01: registrador port map (ck, reset, cpa, A(31 downto 24), pA);
pA02: registrador port map (ck, reset, cpa, A(23 downto 16), pA1);
pA03: registrador port map (ck, reset, cpa, A(15 downto 8), pA2);
pA04: registrador port map (ck, reset, cpa, A(7 downto 0), pA3);

pB01: registrador port map (ck, reset, cpB, B(31 downto 24), pB);
pB02: registrador port map (ck, reset, cpB, B(23 downto 16), pB1);
pB03: registrador port map (ck, reset, cpB, B(15 downto 8), pB2);
pB04: registrador port map (ck, reset, cpB, B(7 downto 0), pB3);

sub1: sub port map (pA, pB, subi);
sub2: sub port map (pA1, pB1, subi1);
sub3: sub port map (pA2, pB2, subi2);
sub4: sub port map (pA3, pB3, subi3);

abs1: absu port map (subi, absi);
abs2: absu port map (subi1, absi1);
abs3: absu port map (subi2, absi2);
abs4: absu port map (subi3, absi3);

Sum91: sum9 port map (absi, absi1, sum19);
Sum92: sum9 port map (absi2, absi3, sum29);

Sumf10: sum10 port map (sum19, sum29, sumf);

sum144: Sum13 port map (soma,"0000" & sumf, sum14);
mux144: mux2para114 port map (sum14, "00000000000000", zsoma, mux14);
soma1: registrador14 port map (ck, reset, csoma, mux14, soma);
SAD_REG: registrador14 port map (ck, reset, csad_reg, soma, saida);



mux77: mux2para1 port map (voltinha, "00000", zi, mux7);
ii: registrador7 port map (ck, reset, ci, mux7, i);
soma7: sum port map (i, "00001", voltinha);

menor <= i(4);
endereco <= i(3 downto 0);


end circuito;