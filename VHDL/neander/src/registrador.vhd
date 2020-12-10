------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------
ENTITY registrador IS
GENERIC (N: integer := 8);
PORT (d: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		clk, reset, ena: IN STD_LOGIC;
		q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END registrador;
------------------------------------------------
ARCHITECTURE registrador_codigo OF registrador IS
BEGIN

	PROCESS (clk, reset, d)
	BEGIN
		IF reset = '0' THEN
			q <= (OTHERS => '0');
		ELSIF clk'EVENT AND clk = '1' THEN
			IF ena = '1' THEN
				q <= d;
			END IF;
		END IF;
	END PROCESS;
END registrador_codigo;
------------------------------------------------		
