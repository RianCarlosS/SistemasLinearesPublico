LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY BC IS
PORT ( ck, rst, iniciar, menor : IN STD_LOGIC;
pronto, zi, ci, cpA, cpB, zsoma, csoma, csad_reg, ler, ci2, csoma2 : OUT STD_LOGIC);
END BC;

ARCHITECTURE Behavior OF BC IS
TYPE Tipo_estado IS (S0, S1, S2, S3, S4, S5);
SIGNAL EstadoAtual, ProximoEstado : Tipo_estado;

BEGIN

PROCESS (iniciar, EstadoAtual, menor)
BEGIN
	CASE EstadoAtual IS
	WHEN S0 =>
		IF iniciar = '0' THEN
			ProximoEstado <= S0;
		ELSE
			ProximoEstado <= S1;
		END IF;
	WHEN S1 => ProximoEstado <= S2;
	WHEN S2 =>
		IF menor <= '0' THEN
			ProximoEstado <= S3;
		ELSE
			ProximoEstado <= S5;
		END IF;
	WHEN S3 => proximoEstado <= S4;
	WHEN S4 => proximoEstado <= S2;
	WHEN S5 => proximoEstado <= S0;
	END CASE;
END PROCESS;

PROCESS (ck, rst)
BEGIN
	IF rst = '1' THEN
		EstadoAtual <= S0;
	ELSIF (rising_edge(ck)) THEN
		EstadoAtual <= ProximoEstado;
	END IF;
END PROCESS;
pronto <= '1' WHEN EstadoAtual = S0 ELSE '0';
zi <= '1' WHEN EstadoAtual = S1 ELSE '0';
cpA <= '1' WHEN EstadoAtual = S3 ELSE '0';
cpB <= '1' WHEN EstadoAtual = S3 ELSE '0';
zsoma <= '1' WHEN EstadoAtual = S1 ELSE '0';
csad_reg <= '1' WHEN EstadoAtual = S5 ELSE '0';
ler <= '1' WHEN EstadoAtual = S3 ELSE '0';
ci <= '1' when Estadoatual = S1 ElsE '0';
ci2 <= '1' when Estadoatual = S4 ElsE '0';
csoma <= '1' when Estadoatual = S1 ElsE '0';
csoma2 <= '1' when Estadoatual = S4 ElsE '0';

	
	
	
END Behavior;
