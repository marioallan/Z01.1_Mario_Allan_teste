------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
------------------------------------------------------
ENTITY alu IS
PORT (a, b: IN STD_LOGIC_VECTOR (7 DOWNTO 0) ;
		s: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		n,z: OUT STD_LOGIC;
		c: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)) ;
END alu;
------------------------------------------------------
ARCHITECTURE alu_codigo OF alu IS

SIGNAL saida: STD_LOGIC_VECTOR(7 DOWNTO 0);
 
BEGIN

c <= saida;

	WITH s SELECT
	
saida <=	b         WHEN "100", --AC <- RDM               --LDA
			a + b     WHEN "000", --AC <- AC + RDM          --ADD
			a OR b    WHEN "010", --AC <- AC OR RDM         --OR 
			a AND b   WHEN "001", --AC <- AC AND RDM        --AND 
			NOT a     WHEN "011", --AC <- NOT AC            --NOT
			(OTHERS => '0')	WHEN OTHERS;
		
n <= '1' WHEN saida < 0 ELSE '0';

z <= '1' WHEN saida = 0 ELSE '0';

END alu_codigo;
------------------------------------------------------