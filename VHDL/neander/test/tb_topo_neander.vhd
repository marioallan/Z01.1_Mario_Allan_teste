LIBRARY ieee; 
LIBRARY std; 
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_textio.all; 
USE ieee.std_logic_unsigned.all; 
USE std.textio.all;

library vunit_lib;
context vunit_lib.vunit_context;

ENTITY tb_topo_neander IS 
  generic (runner_cfg : string);
END; 
 
ARCHITECTURE tb_arch OF tb_topo_neander IS
  
  SIGNAL CLOCK_50 : STD_LOGIC := '0'; 
  SIGNAL KEY : STD_LOGIC;
  SIGNAL DATA_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
  
  COMPONENT topo_neander  
    PORT ( 
      CLOCK_50 : in STD_LOGIC; 
      KEY : in STD_LOGIC;
		  DATA_OUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	  ); 
  END COMPONENT; 
BEGIN
  DUT : topo_neander  
    PORT MAP ( 
      CLOCK_50 => CLOCK_50,
      KEY => KEY,
		  DATA_OUT => DATA_OUT
	  ); 
	 
	-- Para gerar o testbench.vhd
	-- Apos executar a analise e sintese no quartus
	-- Simular o projeto com o ModelSim > Clicar com o botao direito do mouse no projeto carregado
	-- Create Wave > Ao carregar as portas de entrada no janela "Wave" > Clicar com o botao direito do mouse na porta
	-- Edit > Creat/Modify Waveform > Escolher o Patterns dejesado > Next > Escolher valor inicial desejado > Finish
	-- Clicar na janela "Wave" > Ir na aba "File" > "Export" > "Wave form" > Vhdl Testbench e informar o nome do arquivo  
	
	-- Para carregar o arquivo.vhd no modelSim, ir na opção 
	-- Complie > Compile ...
	
   --#########################################
	------------------------------------------- 
	   
CLOCK_50 <= not CLOCK_50 after 50 ps;	  
	  
-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  main : process
	Begin
	test_runner_setup(runner, runner_cfg);
	  
	 key <= '0';
	wait for 100 ps;
	 key <= '1';
-- dumped values till 1 us
	wait;
	assert(DATA_OUT = "00011110")  report "Falha em teste: Resultado != 30" severity error;
	
	test_runner_cleanup(runner); -- Simulacao acaba aqui
	
  End Process;


---- "Clock Pattern" : dutyCycle = 50
---- Start Time = 0 ns, End Time = 1 us, Period = 100 ns
--  Process
--	Begin
--	 clock_50 <= '0';
--	wait for 50 ns;
---- 50 ns, single loop till start period.
--	for Z in 1 to 9
--	loop
--	    clock_50 <= '1';
--	   wait for 50 ns ;
--	    clock_50  <= '0';
--	   wait for 50 ns;
---- 950 ns, repeat pattern in loop.
--	end  loop;
--	 clock_50  <= '1';
--	wait for 50 ns;
---- dumped values till 1 us
--	wait;
-- End Process;
END;
