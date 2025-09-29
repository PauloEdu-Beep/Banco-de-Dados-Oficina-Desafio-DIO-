#Consultas Select
select * from cliente;
select * from mecanicos;
select * from equipe_mecanico;
select * from ordem_de_serviço;
select * from ordem_de_serviço_tem_valor_serviço;
select * from Tabela_serviços;
select * from veiculos;

#-----------------comandos simplificados---------------------#
#Filtragem Where
select * from Cliente
where endereço = 'Rua das Flores, 123';

#Ordenação de dados com order by
select CPF_Cliente, Nome_Cliente
from Cliente
order by Nome_Cliente ASC;

#Having 
select valor_Mão_de_Obra, sum(valor_Mão_de_Obra) as peças_total
from tabela_serviços
group by valor_Mão_de_Obra
having sum(valor_Mão_de_Obra) > 160;

#comando Join
select cliente.nome_cliente, veiculos.modelo
from cliente 
inner join veiculos on cliente.cpf_cliente = veiculos.cliente_cpf_cliente;
#-----------------------------------------------------------------------------

#Comandos mais avançados

#mostra a relação dos clientes e seus veiculos.
select 
c.nome_cliente, c.cpf_cliente, v.placa,
v.modelo, v.ano from cliente c 
join veiculos v on c. cpf_cliente = v.cliente_cpf_cliente
order by c.nome_cliente;

# mostra quais ordens de serviço estão em andamento.
select os.N° as Os_numero, os.data_emissão, os.`Status`,
os.data_conclusão, c.nome_cliente, v.placa
from ordem_de_serviço os
join veiculos v on os.veiculos_placa = v.placa
join cliente c on v.cliente_cpf_cliente = c.cpf_cliente
where os.`Status` = 'Em andamento';

#verifica quais clientes gataram mais de 300 na oficina.
select c.nome_cliente, sum(os.valor) as total_gasto
from cliente c 
join veiculos v on c.cpf_cliente = v.cliente_cpf_cliente 
join ordem_de_serviço os on v.placa = os.veiculos_placa
group by c.nome_cliente having total_gasto > 300.00
order by total_gasto desc;

#verifica quantas ordens de serviço foram realizadas por cada equipe mecanica.
select os.equipe_mecanico_cod_equipe as id_equipe,
count(os.N°) as quantidade_OS_finalizadas
from ordem_de_serviço os where os.`status` = 'Finalizado'
group by os.equipe_mecanico_cod_equipe
having quantidade_OS_finalizadas;