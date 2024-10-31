drop database db_senai;

create database if not exists db_senai;

use db_senai;

create table if not exists tb_curso (
id_curso int primary key auto_increment,
nome_curso varchar(30) not null unique,
carga_horaria int unsigned,
ano year
);

insert into tb_curso(nome_curso, carga_horaria, ano) value
('Engenharia de sofware', 360, 2022),
('Administração', 400, 2021),
('Medicina', 360, null),
('Direito', null, null),
('Arquitetura', 420, 2019),
('Psicologia', 420, 2023),
('Biomedicina', null, 2021),
('Educação Física', 360, 2022),
('Ciência da Computação', 480, 2020),
('Engenharia Civil', 200, 2018),
('Farmácia', 400, 2022),
('Veterinário', 500, null),
('Desing gráfico', 360, 2023),
('Contabilidade', 400, 2022),
('Gestão de Recursos Humanos', 360, 2021),
('Sistemas de Informação', 360, 2022),
('Engenharia Elétrica', 400, 2020),
('Marketing', 360, 2021),
('Turismo', 320, 2023),
('Ciência Biológica', 420, 2019); 

select * from tb_curso
order by nome_curso asc;

select nome_curso, ano from tb_curso
order by ano desc;

select nome_curso, ano from tb_curso
where ano = 2020
order by nome_curso;

select nome_curso, ano from tb_curso
where ano >= 2020
order by nome_curso;

select nome_curso, ano from tb_curso
where ano != 2020
order by nome_curso;

select nome_curso, ano from tb_curso
where carga_horaria > 360 and carga_horaria < 500
order by ano;

select nome_curso from tb_curso
where not carga_horaria > 360 or ano = 2018
order by nome_curso;

select nome_curso, ano from tb_curso
where ano is null;

select nome_curso, carga_horaria, ano from tb_curso
where carga_horaria between 400 and 480
order by ano asc, nome_curso desc;

select nome_curso, ano from tb_curso
where ano in (2018, 2020, 2023);

select * from tb_curso
where nome_curso like 'A%';

select * from tb_curso
where nome_curso like '%A';

select * from tb_curso
where nome_curso like '%A%';

select * from tb_curso
where nome_curso not like '%A%';

select * from tb_curso
where nome_curso like 'Adm%o';

select * from tb_curso
where nome_curso like 'Eng%a%';

select * from tb_curso
where nome_curso like 'Eng%a__'; 

select * from tb_curso
where nome_curso like 'Dir__to';

select count(*) from tb_curso;

select count(*) from tb_curso
where carga_horaria > 400;

select max(carga_horaria) from tb_curso;

select max(carga_horaria) from tb_curso
where ano = 2018;

select min(carga_horaria) from tb_curso
where ano  = 2020;

select sum(carga_horaria) from tb_curso
where ano = 2021;

select avg(carga_horaria) from tb_curso
where ano = 2023; 

select avg(carga_horaria) as media
from tb_curso
where ano = 2023; 

select carga_horaria as carga, count(*) as contagem 
from tb_curso
group by carga_horaria 
order by carga_horaria;

SELECT carga_horaria AS Carga, COUNT(*) AS Contagem
FROM tb_curso
WHERE ano > 2019
GROUP BY carga_horaria
HAVING carga_horaria > (SELECT AVG( carga_horaria) FROM tb_curso)
ORDER BY carga_horaria;


