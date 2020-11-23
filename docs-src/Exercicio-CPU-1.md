# Exercicio CPU - 1

!!! info
    Os problemas aqui descritos são os mesmo do final do [LAB-15](/cpu-lab-1).

## CPU

Proponha uma modificação na `CPU` do nosso Z01.1 que:

 1. Adiciona mais um registrador (`%S`) (onde é melhor?)
 1. Você teria que modificar a linguagem de máquina do nosso HW. Proponha uma solução.
 1. Possibilita %D endereçar a memória 
     - `movw %A, (%D)`
 1. Possibilite fazer carregamento efetivo em %D
     - `leaw $5, %D`

Para cada modificação faça o desenho da nova CPU.

## Extras

!!! example "extra-1"
    Como o controlUnit controla a CPU para realizar a operação de NOP?

!!! example "extra-2"
    Nossa CPU suportaria executar simultaneamente a instrução `movw %D, %A` e ao mesmo tempo a instrução `jg %D`? 

!!! example "extra-3"
    Quais sinais influenciam o loadPC?
