DROP DATABASE IF EXISTS db_mh_sports;

CREATE DATABASE IF NOT EXISTS db_mh_sports;

USE db_mh_sports;

CREATE TABLE tb_cor (
    id_cor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    taxa_extra DECIMAL(10, 2) DEFAULT 0.00
);

INSERT INTO tb_cor VALUES
(DEFAULT, 'Vermelho', 5.50),
(DEFAULT, 'Azul', 3.75),
(DEFAULT, 'Amarelo', DEFAULT),
(DEFAULT, 'Verde', 4.10),
(DEFAULT, 'Laranja', 6.80),
(DEFAULT, 'Roxo', 7.30),
(DEFAULT, 'Preto', 8.00),
(DEFAULT, 'Branco', DEFAULT),
(DEFAULT, 'Cinza', 3.20),
(DEFAULT, 'Rosa', 4.60);


CREATE TABLE tb_cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    COR_id_cor_favorita INT,
    FOREIGN KEY (COR_id_cor_favorita) REFERENCES tb_cor(id_cor)
);

INSERT INTO tb_cliente VALUES
(DEFAULT, 'Ana', 'Silva', 1),
(DEFAULT, 'Carlos', 'Oliveira', 2),
(DEFAULT, 'Beatriz', 'Souza', 3),
(DEFAULT, 'Fernando', 'Almeida', 4),
(DEFAULT, 'Mariana', 'Ferreira', 5),
(DEFAULT, 'João', 'Pereira', 6),
(DEFAULT, 'Camila', 'Costa', 7),
(DEFAULT, 'Pedro', 'Nascimento', NULL),
(DEFAULT, 'Larissa', 'Lima', NULL),
(DEFAULT, 'Gabriel', 'Mendes', 10),
(DEFAULT, 'Tatiane', 'Ribeiro', 1),
(DEFAULT, 'Ricardo', 'Gonçalves', 2),
(DEFAULT, 'Renata', 'Martins', 3),
(DEFAULT, 'Luiz', 'Santos', 4),
(DEFAULT, 'Vanessa', 'Barbosa', 5),
(DEFAULT, 'Fábio', 'Monteiro', 6),
(DEFAULT, 'Juliana', 'Carvalho', 7),
(DEFAULT, 'Lucas', 'Rocha', 8),
(DEFAULT, 'Bruna', 'Vasconcelos', NULL),
(DEFAULT, 'Thiago', 'Azevedo', 10),
(DEFAULT, 'Patrícia', 'Duarte', 1),
(DEFAULT, 'André', 'Castro', 2),
(DEFAULT, 'Daniela', 'Pinto', 3),
(DEFAULT, 'Felipe', 'Moraes', 4),
(DEFAULT, 'Rafael', 'Batista', 5),
(DEFAULT, 'Cíntia', 'Cardoso', 6),
(DEFAULT, 'Marcelo', 'Farias', 7),
(DEFAULT, 'Aline', 'Cunha', 8),
(DEFAULT, 'Paulo', 'Teixeira', NULL),
(DEFAULT, 'Isabela', 'Guedes', 10);


CREATE TABLE tb_categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    CATEGORIA_id_categoria_pai INT,
    FOREIGN KEY (CATEGORIA_id_categoria_pai) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria VALUES
(DEFAULT, 'Roupas', NULL),
(DEFAULT, 'Calçados', NULL),
(DEFAULT, 'Acessórios', NULL),
(DEFAULT, 'Camisetas', 1),
(DEFAULT, 'Calças', 1),
(DEFAULT, 'Shorts', 1),
(DEFAULT, 'Tênis', 2),
(DEFAULT, 'Chinelos', 2),
(DEFAULT, 'Bonés', 3),
(DEFAULT, 'Luvas', 3);


CREATE TABLE tb_roupa (
    id_roupa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    tamanho ENUM('S', 'M', 'L', 'XL', '2XL', '3XL') NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    COR_id_cor INT,
    CATEGORIA_id_categoria INT,
    FOREIGN KEY (COR_id_cor) REFERENCES tb_cor(id_cor),
    FOREIGN KEY (CATEGORIA_id_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_roupa VALUES
(DEFAULT, 'Camiseta Esportiva Básica', 'M', 49.90, 1, 4),
(DEFAULT, 'Camiseta Dry Fit', 'L', 59.90, 2, 4),
(DEFAULT, 'Camiseta Regata', 'S', 39.90, 3, 4),
(DEFAULT, 'Camiseta Manga Longa', 'XL', 69.90, 4, 4),
(DEFAULT, 'Shorts de Corrida', 'M', 45.90, 5, 6),
(DEFAULT, 'Shorts Térmico', 'L', 55.90, 6, 6),
(DEFAULT, 'Calça de Treino', 'XL', 79.90, 7, 5),
(DEFAULT, 'Calça Legging Feminina', 'M', 89.90, 8, 5),
(DEFAULT, 'Blusa Moletom Esportiva', 'L', 99.90, 9, 5),
(DEFAULT, 'Top Esportivo', 'S', 39.90, 10, 4),
(DEFAULT, 'Bermuda de Compressão', 'M', 59.90, 1, 6),
(DEFAULT, 'Jaqueta Corta-Vento', 'L', 149.90, 2, 5),
(DEFAULT, 'Regata Dry Fit Feminina', 'S', 49.90, 3, 4),
(DEFAULT, 'Camiseta UV Proteção', 'XL', 89.90, 4, 4),
(DEFAULT, 'Shorts Multiuso Masculino', 'L', 65.90, 5, 6),
(DEFAULT, 'Calça Jogger Masculina', 'M', 99.90, 6, 5),
(DEFAULT, 'Legging com Bolso', 'S', 89.90, 7, 5),
(DEFAULT, 'Moletom Canguru', 'XL', 109.90, 8, 5),
(DEFAULT, 'Vestido Esportivo Feminino', 'M', 79.90, 9, 4),
(DEFAULT, 'Blusa de Compressão', 'L', 69.90, 10, 5),
(DEFAULT, 'Shorts Feminino Básico', 'S', 49.90, 1, 6),
(DEFAULT, 'Top com Suporte', 'M', 59.90, 2, 4),
(DEFAULT, 'Calça Térmica Masculina', 'XL', 89.90, 3, 5),
(DEFAULT, 'Camiseta Polo Esportiva', 'L', 79.90, 4, 4),
(DEFAULT, 'Bermuda Tecido Leve', 'M', 55.90, 5, 6),
(DEFAULT, 'Blusa com Capuz Feminina', 'S', 99.90, 6, 5),
(DEFAULT, 'Regata Treino Avançado', 'XL', 49.90, 7, 4),
(DEFAULT, 'Camiseta Slim Fit', 'L', 59.90, 8, 4),
(DEFAULT, 'Shorts Moletom Masculino', 'M', 69.90, 9, 6),
(DEFAULT, 'Camiseta Casual Esportiva', 'S', 49.90, 10, 4);


CREATE TABLE tb_pedido_roupa (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    CLIENTE_id_cliente INT,
    ROUPA_id_roupa INT,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (CLIENTE_id_cliente) REFERENCES tb_cliente(id_cliente),
    FOREIGN KEY (ROUPA_id_roupa) REFERENCES tb_roupa(id_roupa)
);

INSERT INTO tb_pedido_roupa  VALUES
(Default, 1, 1, 2, '2024-11-01'),
(Default, 2, 2, 1, '2024-11-02'),
(Default, 3, 3, 3, '2024-11-03'),
(Default, 4, 4, 1, '2024-11-04'),
(Default, 5, 5, 2, '2024-11-05'),
(Default, 6, 6, 1, '2024-11-06'),
(Default, 7, 7, 4, '2024-11-07'),
(Default, 8, 8, 2, '2024-11-08'),
(Default, 9, 9, 1, '2024-11-09'),
(Default, 1, 10, 3, '2024-11-10'),
(Default, 2, 11, 2, '2024-11-11'),
(Default, 3, 12, 1, '2024-11-12'),
(Default, 4, 13, 3, '2024-11-13'),
(Default, 5, 14, 2, '2024-11-14'),
(Default, 6, 15, 4, '2024-11-15'),
(Default, 16, 4, 2, '2024-11-16'),
(Default, 17, 5, 1, '2024-11-17'),
(Default, 18, 6, 3, '2024-11-18'),
(Default, 19, 7, 1, '2024-11-19'),
(Default, 20, 8, 2, '2024-11-20');
-- 1
SELECT 
    tb_roupa.nome AS roupa,
    tb_cor.nome AS cor,
    tb_cliente.primeiro_nome AS nome,
    tb_cliente.sobrenome
FROM
    tb_pedido_roupa
        JOIN tb_roupa ON 
			tb_roupa.id_roupa = tb_pedido_roupa.ROUPA_id_roupa
        JOIN tb_cor ON
			tb_cor.id_cor = tb_roupa.COR_id_cor
		JOIN tb_cliente ON
			tb_cliente.id_cliente = tb_pedido_roupa.CLIENTE_id_cliente
WHERE tb_cliente.COR_id_cor_favorita = tb_roupa.COR_id_cor
ORDER BY tb_cliente.primeiro_nome;
-- 2
select tb_cliente.primeiro_nome as nome,
tb_cliente.sobrenome,
tb_cor.nome as Cor_Favorita
from tb_cliente
join tb_cor
on tb_cor.id_cor = tb_cliente.COR_id_cor_favorita
left join tb_pedido_roupa
on tb_pedido_roupa.CLIENTE_id_cliente = tb_cliente.id_cliente
where tb_pedido_roupa.CLIENTE_id_cliente is null;
-- 3
select c1.nome as Categoria,
c2.nome as SubCategoria
from tb_categoria c1
left join tb_categoria c2
on c1.id_categoria = c2.CATEGORIA_id_categoria_pai
where c1.CATEGORIA_id_categoria_pai is null;

-- Exercício 4: Criar a view vw_detalhes_pedidos 
CREATE VIEW vw_detalhes_pedidos AS 
SELECT CONCAT(c.primeiro_nome, ' ', c.sobrenome) 
AS nome_completo, r.nome AS nome_roupa,
co.nome AS cor_roupa, 
p.quantidade, p.data_pedido 
FROM tb_pedido_roupa p 
JOIN tb_cliente c 
ON p.CLIENTE_id_cliente = c.id_cliente 
JOIN tb_roupa r ON p.ROUPA_id_roupa = r.id_roupa 
JOIN tb_cor co ON r.COR_id_cor = co.id_cor; 
-- Exercício 5: Pedidos de roupas na cor “Vermelho”
 SELECT * FROM vw_detalhes_pedidos
 WHERE cor_roupa = 'Vermelho';
 -- Exercício 6: Categorias principais e roupas disponíveis 
 SELECT c1.nome AS categoria_principal, 
 c2.nome AS subcategoria, r.nome AS 
 nome_roupa FROM tb_categoria c1 
 LEFT JOIN tb_categoria c2 
 ON c1.id_categoria = c2.CATEGORIA_id_categoria_pai 
 JOIN tb_roupa r 
 ON r.CATEGORIA_id_categoria = COALESCE(c2.id_categoria, c1.id_categoria);
 -- Exercício 7: Criar a view vw_cores_populares 
 CREATE VIEW vw_cores_populares 
 AS SELECT co.nome AS cor, SUM(p.quantidade) 
 AS total_vendido FROM tb_pedido_roupa p 
 JOIN tb_roupa r ON p.ROUPA_id_roupa = r.id_roupa 
 JOIN tb_cor co ON r.COR_id_cor = co.id_cor 
 GROUP BY co.nome; 
 -- Exercício 8: Cores que venderam mais de 10 itens 
 SELECT * FROM vw_cores_populares
 WHERE total_vendido > 10; 
 -- Exercício 9: Pedidos realizados entre “2024-11-01” e “2024-11-10” 
 SELECT CONCAT(c.primeiro_nome, ' ', c.sobrenome) 
 AS nome_completo, r.nome AS nome_roupa, p.data_pedido
 FROM tb_pedido_roupa p 
 JOIN tb_cliente c 
 ON p.CLIENTE_id_cliente = c.id_cliente 
 JOIN tb_roupa r ON p.ROUPA_id_roupa = r.id_roupa 
 WHERE p.data_pedido
 BETWEEN '2024-11-01' AND '2024-11-10'; 
 -- Exercício 10: Pedidos com cor favorita disponível na roupa comprada 
 SELECT CONCAT(c.primeiro_nome, ' ', c.sobrenome) 
 AS nome_completo, r.nome AS nome_roupa,
 c1.nome AS categoria_principal 
 FROM tb_pedido_roupa p 
 JOIN tb_cliente c 
 ON p.CLIENTE_id_cliente = c.id_cliente 
 JOIN tb_roupa r ON p.ROUPA_id_roupa = r.id_roupa 
 JOIN tb_categoria c1 
 ON r.CATEGORIA_id_categoria = c1.id_categoria 
 WHERE c.COR_id_cor_favorita = r.COR_id_cor;






