----------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------------------------------------------------------------------------------------------
ENTITY topo_neander IS
	GENERIC (N: POSITIVE := 8);
	PORT (
			KEY, CLOCK_50: IN STD_LOGIC;
			DATA_OUT: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END topo_neander;
----------------------------------------------------------------------------------------------------
ARCHITECTURE topo_neander_logica OF topo_neander IS
 ----------- signal declaration---------------------------------------------------------------------
 SIGNAL FA, FB, FC, FD, FE, FF, FG, FH, FI, FK, FL, FM, FN, FO: STD_LOGIC;
 SIGNAL FJ: STD_LOGIC_VECTOR (2 DOWNTO 0);
 SIGNAL FP: STD_LOGIC_VECTOR (3 DOWNTO 0);
 SIGNAL FQ, FR, FS, FT, FU, FV, FX, FW, FZ, F0: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
 -----------componente declaration------------------------------------------------------------------ 
COMPONENT somador IS
	PORT (a: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0); 
			b: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0 ));
END COMPONENT;
 -----------componente declaration------------------------------------------------------------------
COMPONENT mux IS
	PORT (a, b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sel: IN STD_LOGIC;
			y: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END COMPONENT;
 -----------componente declaration------------------------------------------------------------------
COMPONENT registrador IS
	GENERIC (N: integer := 8);
	PORT (d: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			clk, reset, ena: IN STD_LOGIC;
			q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END COMPONENT;
-----------componente declaration------------------------------------------------------------------
COMPONENT registrador_2 IS
	GENERIC (N: integer := 8);
	PORT (d, d2: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			clk, reset, ena: IN STD_LOGIC;
			q, q2: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END COMPONENT;
 -----------componente declaration------------------------------------------------------------------
COMPONENT alu IS
	PORT (a, b: IN STD_LOGIC_VECTOR (7 DOWNTO 0) ;
			s: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			n,z: OUT STD_LOGIC;
			c: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)) ;
END COMPONENT;
 -----------componente declaration------------------------------------------------------------------
COMPONENT fsm IS
	PORT (ri: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			clk, rst, n, z: IN STD_LOGIC;
			ula_sel: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			mux_pc, pc_ena, mux_rem, rem_ena, rd, wr, rdm_ena, ac_ena, nz_ena, ri_ena: OUT STD_LOGIC);
END COMPONENT;
-----------componente declaration------------------------------------------------------------------
COMPONENT memoria IS
	PORT	(address: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			 clock: IN STD_LOGIC ;
			 data: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			 rden: IN STD_LOGIC ;
			 wren: IN STD_LOGIC ;
			 q: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END COMPONENT;
-----component instatiation---------------------------------------------------------------------------------------
BEGIN

 nd_fsm: fsm 
 PORT MAP (rst=>KEY, clk=>CLOCK_50, mux_pc=>FC, pc_ena=>FD, mux_rem=>FE, rem_ena=>FF, rd=>FG, 
			  wr=>FH, rdm_ena=>FI, ula_sel=>FJ, ac_ena=>FK, nz_ena=>FL, z=>FM, n=>FN, ri_ena=>FO, 
			  ri=>FP);
										 
 nd_muxpc: mux 
 PORT MAP (a=>FQ, b=>FZ, sel=>FC, y=>FR);
 
 nd_pc: registrador 
 PORT MAP (d=>FR, clk=>CLOCK_50, reset=>KEY, ena=>FD, q=>FS);
 
 nd_somador: somador
 PORT MAP (a=>FS, b=>FQ);
 
 nd_muxrem: mux 
 PORT MAP (a=>FS, b=>FZ, sel=>FE, y=>FT);
 
 nd_rem: registrador 
 PORT MAP (d=>FT, clk=>CLOCK_50, reset=>KEY, ena=>FF, q=>FU);
 
 nd_mem: memoria 
 PORT MAP (address=>FU, clock=>CLOCK_50, data=>FV, rden=>FG, wren=>FH, q=>FX);
 
 nd_rdm: registrador_2 
 PORT MAP (d=>FX, d2=>FW, clk=>CLOCK_50, reset=>KEY, ena=>FI, q=>FZ, q2=>FV);
 
 nd_alu: alu 
 PORT MAP (a=>FW, b=>FZ, s=>FJ, n=>FB, z=>FA, c=>F0);
 
 nd_ac: registrador 
 PORT MAP (d=>F0, clk=>CLOCK_50, reset=>KEY, ena=>FK, q=>FW);
 
 nd_nz: registrador_2 
 GENERIC MAP (N=>1) 
 PORT MAP (d(0)=>FA, d2(0)=>FB, clk=>CLOCK_50, reset=>KEY, ena=>FL, q(0)=>FM,
																	q2(0)=>FN);
 nd_ri: registrador 
 GENERIC MAP (N=>4) 
 PORT MAP (d=>FZ (7 DOWNTO 4), clk=>CLOCK_50, reset=>KEY, ena=>FO, q=>FP);
 
 DATA_OUT <= FW;
 

 END topo_neander_logica;
 -----------------------------------------------------------------------------------------------------------------
 