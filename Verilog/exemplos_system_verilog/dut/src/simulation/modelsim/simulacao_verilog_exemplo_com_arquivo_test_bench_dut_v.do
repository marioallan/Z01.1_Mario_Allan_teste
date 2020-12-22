#E possivel executar a simulaçao tambem apenas com  "vlib work" e comentando os dois comandos seguintes "vlib rtl_work" e "vmap work rtl_work". Porem sem o "vmap" não vai ser criado o arquivo modelsim.ini
#vlib work

vlib rtl_work
vmap work rtl_work

vlog -work work ../../dut.sv

vlog -work work -sv test_bench_dut.sv

vsim work.tb

do wave_simulacao_verilog_exemplo_com_arquivo_test_bench_dut_v.do

#run 1.4 ns

run -all
