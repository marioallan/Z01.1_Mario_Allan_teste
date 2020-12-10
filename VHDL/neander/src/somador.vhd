------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
------------------------------------------------
ENTITY somador IS
	PORT(a: IN STD_LOGIC_VECTOR (7 DOWNTO 0); 
		  b: OUT STD_LOGIC_VECTOR (7 DOWNTO 0 ));
END somador;
------------------------------------------------
ARCHITECTURE somador_codigo OF somador IS
BEGIN
	b <= a + "00000001";
	
END somador_codigo;
------------------------------------------------