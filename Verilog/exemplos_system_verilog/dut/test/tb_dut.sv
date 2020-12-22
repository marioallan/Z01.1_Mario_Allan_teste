// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this file,
// You can obtain one at http://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2014-2020, Lars Asplund lars.anders.asplund@gmail.com

`include "vunit_defines.svh"

module tb_dut; 
 
  reg x; 
  reg y;
  
  dut DUT (
		.vint (x),
      .vout (y)
     
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
  initial
  begin
	 x = 1'b0;
//	 #100 x = 1'b1;
//	 #100 x = 1'b0;
//	 #100 x = 1'b1;
//	 #500 x = 1'b0;
//	 #200 x = 1'b1;
// dumped values till 1 ns
  end

  initial
	#1400 $stop;

  

   `TEST_SUITE begin
	
      `TEST_CASE("Test that pass") begin
         @(y);
         `CHECK_EQUAL(y, 0);
      end
		
      `TEST_CASE("Test that fail") begin
         @(y);
         `CHECK_EQUAL(y, 1);
      end

	end
endmodule
