
//`timescale 1ps / 1ps

`include "vunit_defines.svh"

module tb; 

`TEST_SUITE begin

  reg x; 
  reg y; 
  wire z; 
  and_verilog DUT (
      .a (x),
      .b (y),
      .c (z) 
	); 
	// Para gerar o testbench.v
	// Apos executar a analise e sintese no quartus
	// Simular o projeto com o ModelSim > Clicar com o botao direito do mouse no projeto carregado
	// Create Wave > Ao carregar as portas de entrada no quadro "Wave" > Clicar com o botao direito do mouse na porta
	// Edit > Creat/Modify Waveform > Escolher o Patterns dejesado > Next > Escolher valor inicial desejado > Finish
	// Clicar na janela "Wave" > Ir na aba "File" > "Export" > "Wave form" > Verilog Testbench e informar o nome do arquivo 
	
	// Para carregar o arquivo.vhd no modelSim, ir na opÃ§Ã£o 
	// Complie > Compile ...
	
   //#########################################
	//----------------------------------------- 

// "Constant Pattern"
// Start Time = 0 ps, End Time = 1 ns, Period = 0 ps



 // initial
  //begin
  
   //`TEST_CASE("test_AND_com_NOT") begin
	$display("Iniciando Teste");
	 x = 1'b0;
	 y = 1'b0;
	`CHECK_EQUAL(z, 1);
	//end
	
	//#100 x = 1'b1;
	
	// #100 x = 1'b0;
	// #100 x = 1'b1;
	// #500 x = 1'b0;
	// #200 x = 1'b1;
// dumped values till 1 ns
  //end


// "Constant Pattern"
// Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  
  //initial
 // begin
	 //y = 1'b1;
	 //#200 y = 1'b0;
	 //#300 y = 1'b1;
// dumped values till 1 ns
  //end

  //initial
	//#1400 $stop;
	
	//end

end;
endmodule
