-----------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------
ENTITY mux IS
	PORT (a, b: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel: IN STD_LOGIC;
			y: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END mux;
-----------------------------------------------
ARCHITECTURE mux_codigo OF mux IS
BEGIN
	
y <= 	a WHEN sel='0' ELSE
		b WHEN sel='1';
END mux_codigo;
-----------------------------------------------