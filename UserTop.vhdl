LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY UserTop IS
PORT (a, b : IN std_logic_vector (31 DOWNTO 0);
Saida : OUT std_logic_vector (13 DOWNTO 0);
ck, reset, iniciar: in std_logic;
ler, pronto: out std_LOGIC;
endereco: out std_logic_vector (3 downto 0)
);
END UserTop;

ARCHITECTURE arch OF UserTop IS

signal zi, ci, cpa, cpb, zsoma, csoma, csad_reg, menor, ci2, csoma2: std_logic;

component bo is
port ( zi, ci, cpa, cpb, zsoma, csoma, csad_reg, ck, reset: in std_logic;
menor: out std_logic;

A, B: in std_logic_vector(31 downto 0);
Saida: out std_logic_vector (13 downto 0);
endereco: out std_logic_vector (3 downto 0)

);
end component;

component BC IS
PORT ( ck, rst, iniciar, menor : IN STD_LOGIC;
pronto, zi, ci, cpA, cpB, zsoma, csoma, csad_reg, ler, ci2, csoma2 : OUT STD_LOGIC);
END component;

BEGIN

BO1: bo port map (zi, (ci or ci2), cpa, cpb, zsoma, (csoma or csoma2), csad_reg, ck, reset, menor, A, B, saida, endereco);

BC1: BC port map (ck, reset, iniciar, menor, pronto, zi, ci, cpa, cpb, zsoma, csoma, csad_reg, ler, ci2, csoma2);




END arch;