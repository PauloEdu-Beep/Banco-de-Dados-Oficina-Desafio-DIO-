# Inserção de dados nas tabelas
use Oficina;

insert into Cliente( CPF_cliente, Nome_Cliente, Endereço) VALUES
('12345678901', 'João Silva', 'Rua das Flores, 123'),
('98765432100', 'Maria Oliveira', 'Av. Brasil, 456'),
('45678912399', 'Carlos Souza', 'Rua do Sol, 789'),
('32165498700', 'Fernanda Lima', 'Rua das Acácias, 101'),
('65498732111', 'Bruno Rocha', 'Av. Amazonas, 222'),
('78912345688', 'Patrícia Gomes', 'Rua do Café, 333'),
('15975348622', 'Eduardo Tavares', 'Rua das Palmeiras, 444');
#-------------------------------------------------------------------------
INSERT INTO Veiculos (Placa, Modelo, Ano, Cliente_CPF_Cliente) VALUES
('ABC1234', 'Fiat Uno', 2010, '12345678901'),
('XYZ9876', 'Chevrolet Onix', 2018, '98765432100'),
('JKL4567', 'Volkswagen Gol', 2015, '45678912399'),
('MNO7890', 'Renault Sandero', 2020, '32165498700'),
('PQR3210', 'Toyota Corolla', 2019, '65498732111'),
('STU6543', 'Honda Civic', 2017, '78912345688'),
('VWX8520', 'Hyundai HB20', 2021, '15975348622');
#-------------------------------------------------------------------------
INSERT INTO Mecanicos (Cod_mecanico, Nome_Mecanico, Endereço, Especialidade) VALUES
(1, 'Pedro Lima', 'Rua Bela Vista, 101', 'Motor'),
(2, 'Ana Costa', 'Rua das Palmeiras, 303', 'Suspensão'),
(3, 'Rafael Mendes', 'Avenida Central, 202', 'Freios'),
(4, 'Juliana Torres', 'Av. dos Bicos, 444', 'Elétrica'),
(5, 'Lucas Martins', 'Rua Santa Clara, 909', 'Transmissão'),
(6, 'Camila Duarte', 'Avenida Liberdade, 675', 'Diagnóstico'),
(7, 'Fernando Alves', 'Rua Nova Esperança, 707', 'Ar-condicionado'),
(8, 'Rodrigo Ferreira', 'Rua do Sol, 777', 'Injeção eletrônica'),
(9, 'Simone Andrade', 'Rua das Laranjeiras, 823', 'Pintura automotiva'),
(10, 'Tiago Monteiro', 'Av. das Tintas, 509', 'Troca de embreagem'),
(11, 'Larissa Campos', 'Rua Dom Pedro II, 606', 'Diagnóstico avançado'),
(12, 'Marcelo Farias', 'Rua Santo Antônio, 190','Sistema de arrefecimento'),
(13, 'Beatriz Lima', 'Rua do Cedro, 723', 'Direção hidráulica');
#---------------------------------------------------------------------------
INSERT INTO Equipe_Mecanico (Cod_Equipe, Nome_Mecanico) VALUES
(1, 'Pedro Lima'),
(1, 'Ana Costa'),
(1, 'Juliana Torres'),
(2, 'Rafael Mendes'),
(2, 'Lucas Martins'),
(3, 'Camila Duarte'),
(3, 'Fernanda Lopes'),
(4, 'Rodrigo Ferreira'),
(4, 'Simone Andrade'),
(5, 'Tiago Monteiro'),
(5, 'Larissa Campos'),
(6, 'Marcelo Lima'),
(6, 'Beatriz Lima');
#-------------------------------------------------------------------------
INSERT INTO mecanicos_tem_equipe_mecanico (Mecanicos_Cod, Equipe_Mecanico_Cod_Equipe) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6);
#-------------------------------------------------------------------------
INSERT INTO Tabela_serviços (Cod_Serviço, Descrição_Serviço, Valor_Mão_de_obra) VALUES
(1, 'Troca de óleo', 80),
(2, 'Alinhamento', 120),
(3, 'Revisão completa', 300),
(4, 'Balanceamento', 100),
(5, 'Troca de freios', 250),
(6, 'Diagnóstico eletrônico', 150),
(7, 'Limpeza de bicos', 180);
#---------------------------------------------------------------------------
INSERT INTO `Peças` (Cod_Peça, Nome_Peça, Valor_Unitário) VALUES
(1, 'Filtro de óleo', 35),
(2, 'Pastilha de freio', 90),
(3, 'Amortecedor', 150),
(4, 'Correia dentada', 120),
(5, 'Sensor de temperatura', 85),
(6, 'Velas de ignição', 60),
(7, 'Bico injetor', 110);
#----------------------------------------------------------------------------
INSERT INTO Ordem_de_Serviço (N°, Data_Emissão, Valor, `Status`, Data_Conclusão, Veiculos_Placa, Equipe_Mecanico_Cod_Equipe) VALUES
(8, '2025-09-15', 195.00, 'Finalizado', '2025-09-16', 'ABC1234', 1),
(9, '2025-09-17', 340.00, 'Em andamento', NULL, 'XYZ9876', 2),
(10, '2025-09-18', 260.00, 'Finalizado', '2025-09-19', 'JKL4567', 3),
(11, '2025-09-20', 180.00, 'Aguardando peças', NULL, 'MNO7890', 4),
(12, '2025-09-21', 410.00, 'Finalizado', '2025-09-22', 'PQR3210', 5),
(13, '2025-09-23', 330.00, 'Em andamento', NULL, 'STU6543', 6),
(14, '2025-09-24', 290.00, 'Finalizado', '2025-09-25', 'VWX8520', 6);
#----------------------------------------------------------------------------
INSERT INTO Ordem_de_Serviço_Tem_Valor_Serviço (Ordem_de_Serviço_N°, Valor_Serviço_Cod_Serviço) VALUES
(8, 1),
(9, 3),
(10, 5),
(11, 6),
(12, 2),
(13, 4),
(14, 7);
#----------------------------------------------------------------------------
INSERT INTO `OS_Peças` (Ordem_de_Serviço_N°, Peças_Cod_Peça) VALUES
(8, 1),
(9, 2),
(10, 3),
(11, 4),
(12, 5),
(13, 6),
(14, 7);