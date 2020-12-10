#!/bin/bash

export VUNIT_SIMULATOR=modelsim
export VUNIT_MODELSIM_PATH=$HOME/modelsim_ase/bin/
#export VUNIT_MODELSIM_PATH=$HOME/altera/14.1/modelsim_ase/bin

##############################################
# INSERIR AQUI !!!
###############################################
#script:
  ## Instal Z01.1 tools
# bash updateZ01tools.sh

  ## run scripts
  #python3 Projetos/A-AmbienteDesenvolvimento/testeAmbienteDesenvolvimento.py
  #python3 Projetos/B-LogicaCombinacional/testeLogicaCombinacional.py 
  #python3 Verilog/exemplos_system_verilog/run.py
  #python3 Verilog/exemplos_verilog/run.py
  python3 VHDL/exemplos_vhdl/run.py
  #python3 VHDL/neander/run_sem_arquivo_mif.py
  python3 VHDL/neander/run_com_arquivo_mif.py
