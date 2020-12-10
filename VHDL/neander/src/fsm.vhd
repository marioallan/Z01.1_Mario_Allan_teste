------------------------------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
------------------------------------------------------------------------------------------------------
ENTITY fsm IS
PORT (
		ri: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		clk, rst, n, z: IN STD_LOGIC;
		ula_sel: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		mux_pc, pc_ena, mux_rem, rem_ena, rd, wr, rdm_ena, ac_ena, nz_ena, ri_ena: OUT STD_LOGIC
		);
END fsm;
------------------------------------------------------------------------------------------------------
ARCHITECTURE fsm_codigo OF fsm IS

TYPE states IS (RESET, B0, B1, B2, B3, B4, D, 
					 E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, 
					 JMP_NZ_1, JNZ_0, STA, LDA, ADD, ORR, ANDD, NOTT, HLT);
SIGNAL ea, pe: states;

BEGIN
 --P1---------------------------------------------
 --P1---------------------------------------------
PROCESS (clk,rst)
	BEGIN
		IF rst = '0' THEN
			ea <= reset;
		ELSIF clk'EVENT AND clk = '0' THEN
			ea <= pe;
		END IF;

END PROCESS;
 --P1----------------------------------------------
 --P1---------------------------------------------

 --P2----------------------------------------------
 --P2----------------------------------------------
PROCESS (ea, ri)
	BEGIN
		CASE ea IS
			
			WHEN RESET => 
							pe <= B0;
							
			WHEN B0 => 
							pe <= B1;
							
			WHEN B1 => 
							pe <= B2;
			
			WHEN B2 => 
							pe <= B3;
							
			WHEN B3 => 
							pe <= B4;
			
			WHEN B4 => 
							pe <= D; 
								
			WHEN D =>
								CASE ri IS
										WHEN "0000" =>
														pe <= B0;
										
										WHEN "0001" | "0010" | "0011" | "0100" | "0101" | "1000" =>
																													pe <= E0;
										
										WHEN "0110" =>
														pe <= NOTT;
												
										WHEN "1001" =>
														IF n = '1' THEN 
																pe <= E0;
														ELSE
																pe <= JNZ_0;
														END IF;
										
										WHEN "1010" =>
														IF z = '1' THEN 
																pe <= E0;
														ELSE
																pe <= JNZ_0;
														END IF;																
										
										WHEN OTHERS =>
														pe <= HLT;
								END CASE;
														
			WHEN E0 =>
								CASE ri IS
										WHEN "0001" | "0010" | "0011" | "0100" | "0101" =>
																										pe <= E3;
										
										WHEN "1000" =>
														pe <= E1;
										
										WHEN "1001" =>
														IF n = '1' THEN 
																pe <= E1;
														ELSE
																pe <= HLT;
														END IF;
										
										WHEN "1010" =>
														IF z = '1' THEN 
																pe <= E1;
														ELSE
																pe <= HLT;
														END IF;
										
										WHEN OTHERS =>
														pe <= HLT;			
								END CASE;
			
			WHEN E1 => 
							  pe <= E2;
							  
			WHEN E3 => 
							  pe <= E4;	
			
			WHEN E2 => 
							  pe <= JMP_NZ_1;
			
			WHEN E4 => 
							  pe <= E5;	
			
			WHEN E5 => 
							  pe <= E6;											
			
			WHEN E6 => 
							  CASE ri IS
										WHEN "0001" =>
														pe <= E7;
																									
										WHEN "0010" | "0011" | "0100" | "0101" =>
																							pe <= E8;
								
										WHEN OTHERS =>
														pe <= HLT;			
								END CASE;		
			
			WHEN E7 => 
							  pe <= STA;	
			
			WHEN E8 => 
							  pe <= E9;	
			
			WHEN E9 => 
							  CASE ri IS
										WHEN "0010" =>
														pe <= LDA;	
										
										WHEN "0011" =>
														pe <= ADD;	
										
										WHEN "0100" =>
														pe <= ORR;		
										
										WHEN "0101" =>
														pe <= ANDD;	
										
										WHEN OTHERS =>
														pe <= HLT;			
							  END CASE;
								
			WHEN NOTT | JNZ_0 | JMP_NZ_1 | STA | LDA | ADD | ORR | ANDD =>
																								 pe <= B0;											
			
			WHEN OTHERS =>
							pe<= HLT;
							
								
		END CASE;
							
END PROCESS;
 --P2----------------------------------------------
 --P2----------------------------------------------

 --P3----------------------------------------------
 --P3----------------------------------------------
PROCESS (clk)
	BEGIN
			IF clk'EVENT AND clk = '1' THEN			
					
					CASE ea IS
								WHEN RESET => 
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
													
								WHEN B0 => 
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= '0';
													rem_ena <= '1';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
								
								WHEN B1 => 
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '1';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
								
								WHEN B2 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '1';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
								
								WHEN B3 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '1';
													
								WHEN B4 =>
													mux_pc <= '0';
													pc_ena <= '1';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';					
			
								WHEN D =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
													
								WHEN E0 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= '0';
													rem_ena <= '1';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
													
								WHEN JNZ_0 =>
													mux_pc <= '0';
													pc_ena <= '1';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
													
								WHEN E1 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '1';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
													
								WHEN E3 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '1';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E2 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '1';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E4 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '1';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN JMP_NZ_1 =>
													mux_pc <= '1';
													pc_ena <= '1';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E5 =>
													mux_pc <= '0';
													pc_ena <= '1';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E6 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= '1';
													rem_ena <= '1';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E7 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '1';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E8 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '1';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN E9 =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '1';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';	
								
								WHEN STA =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '1';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';
								
								WHEN LDA =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "100";
													ac_ena <= '1';
													nz_ena <= '1';
													ri_ena <= '0';	
								
								WHEN ADD =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "000";
													ac_ena <= '1';
													nz_ena <= '1';
													ri_ena <= '0';
								
								WHEN ORR =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "010";
													ac_ena <= '1';
													nz_ena <= '1';
													ri_ena <= '0';
													
								WHEN ANDD =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "001";
													ac_ena <= '1';
													nz_ena <= '1';
													ri_ena <= '0';
													
								WHEN NOTT =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "011";
													ac_ena <= '1';
													nz_ena <= '1';
													ri_ena <= '0';
													
								WHEN OTHERS =>
													mux_pc <= 'X';
													pc_ena <= '0';
													mux_rem <= 'X';
													rem_ena <= '0';
													rd <= '0';
													wr <= '0';
													rdm_ena <= '0';
													ula_sel <= "XXX";
													ac_ena <= '0';
													nz_ena <= '0';
													ri_ena <= '0';																
					END CASE;
			END IF;				
END PROCESS;
 --P3----------------------------------------------
 --P3----------------------------------------------
END fsm_codigo;
------------------------------------------------------------------------------------------------------