DROP DATABASE IF EXISTS db_papelaria;

CREATE DATABASE db_papelaria;

USE db_papelaria;

CREATE TABLE tb_cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL, 
telefone VARCHAR(15), 
email VARCHAR(100),
endereço VARCHAR(100)
);

CREATE TABLE tb_vendedor(
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(15),
carga VARCHAR(100),
endereço VARCHAR(100)
);

CREATE TABLE tb_produto(
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
preço DECIMAL(10, 2) NOT NULL,
função VARCHAR(100),
modelo VARCHAR(50),
classificação VARCHAR(100)
);

INSERT INTO tb_cliente (id_cliente, nome, telefone, email, endereço) VALUES
(1, 'Mariana', '11999999999', 'mariana@email.com', 'R. Duque de Caxias, 494'),
(2, 'Antonela', '11444444444', 'antonela@email.com', 'R. Duque de Caxias, 460'),
(4, 'Leonardo', '11777777777', 'leonardo@email.com', 'R. Duque de Caxias, 496'),
(5, 'Bruno', '21988888888', 'bruno@email.com', 'R. Duque de Caxias, 492');

INSERT INTO tb_vendedor (nome, telefone, carga, endereço) VALUES
('Flavia', '12345678976', 'oito horas', ' R. Santa Rosália, 30'),
('Bernardo', '67987654321', 'seis horas', ' R. Santa Rosália, 37');

INSERT INTO tb_produto (id_produto, nome, preço, função, modelo, classificação) VALUES
(1, 'Caneta Azul', 2.50, 'escrever', 'bic', 'dentro do estojo'),
(2, 'Caderno 100 folhas', 15.00, 'escrever', 'espiral', 'folha'),
(3, 'Borracha', 1.50, 'apagar', 'cis', 'dentro do estojo');

ALTER TABLE tb_produto 
ADD estoque 
INT DEFAULT 100;

ALTER TABLE tb_vendedor
ADD constraint fk_id_cliente 
foreign key (tb_vendedor)
REFERENCES tb_cliente(id_cliente);

UPDATE tb_produto 
SET estoque = estoque - 10 
WHERE id_produto = 1; 


SELECT tb_cliente.nome, tb_produto.nome 
FROM tb_cliente
JOIN vendedor ON tb_vendedor.id_cliente = tb_vendedor.id_
JOIN Produto ON ItemVenda.id_produto = Produto.id_produto;

CREATE VIEW RelatorioVendas AS
SELECT tb_cliente.nome AS Cliente, SUM(preco.quantidade * preco.quantidade) AS TotalVenda
FROM tb_vendedor
JOIN Cliente ON tb_vendedor.id_cliente = tb_cliente.id_cliente
GROUP BY tb_produto.id_produto, tb_cliente.nome;
