------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY registrador_2 IS
GENERIC (N: integer := 8);
PORT (d, d2: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		clk, reset, ena: IN STD_LOGIC;
		q, q2: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END registrador_2;
------------------------------------------------
ARCHITECTURE registrador_2_codigo OF registrador_2 IS
BEGIN

	PROCESS (clk, reset, d, d2)
	BEGIN
		IF reset = '0' THEN
			q <= (OTHERS => '0');
			q2 <= (OTHERS => '0');
		ELSIF clk'EVENT AND clk = '1' THEN
			IF ena = '1' THEN
				q <= d;
				q2 <= d2;
			END IF;
		END IF;
	END PROCESS;
END registrador_2_codigo;
------------------------------------------------		
