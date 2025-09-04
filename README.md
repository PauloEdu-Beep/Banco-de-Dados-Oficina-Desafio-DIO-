# Banco-de-Dados-Oficina-Desafio-DIO

## Introdução
O presente README tem como Finalidade explicar o  
seguinte banco de dados conceitual de uma Oficina;  

## Objetivo
Criar um banco de dados que sirva como um sistema de controle e   
gerenciamento de execução de ordens de serviço em uma oficina mecânica.

## Entidades e o que cada uma faz.
Cliente - Armazena Dados dos clientes.  

Veiculos - Armarzena Dados dos veiculos e se relaciona   
com a tabela Cliente.  

Mecanicos - Contem as informções dos mecanicos operando na oficina. 

Equipe_mecanicos - Registra como está divida cada equipe.  

Tabela_de_Serviço - Guarda as descrições do serviço e os valores de cada um. 

Ordem_de_Serviço - Onde ficara registrado o numero da ordem data de sua emissão  
e o tempo estimado de entrega além do status.  

Peças - um catologo das peças disponiveis e seus valores unitarios.  

OS_Peças - relação muito para muitos entre peças e ordem de serviço  
permitindo que a Os tenham multiplos serviços e peças.

## Ferramentas Utilizadas
MySQL WorkBench;
