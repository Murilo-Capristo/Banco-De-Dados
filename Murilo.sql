parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
        mat_fun - N - 4 -  Pk
        nm_fun  - A - 30 - Nn
        dt_adm  - D -      Nn
        salario - N - 8,2
        Sexo    - C - 1 -  Nn
        
Criando tabelas:
Sintaxe: create table nome_tabela (nome_coluna1 datatype(size) [constraint],
                                   nome_coluna2 datatype(size) [constraint],
                                      mat_fun      N    (  4 ) [    Pk    ]
                                   );
                                   
obs: constaint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcionario:

create table funcionario (  mat_fun  Number(4)Primary key,
                            nm_fun   varchar(30) Not null,
                            dt_adm  Date not null,
                            salario  Number (8,2),
                            sexo    Char(1)not null);
                            
                            

                                
desc funcionario_2024

Relacionamentos: 1 - N criando a FK

Tabela cargo - 
cd_cargo - N - 4 - Pk
nm_cargo - A - 25 - Nn, Uk
salario - N - 8,2

create table cargo( 
cd_cargo Number(4) constraint cargo_cd_Pk Primary Key,
nm_cargo varchar(25) constraint cargo_nm_nn1 Not null
                     constraint cargo_nm_uk1 unique,
salario Number(8,2));


Tabela: Funcionario, ja existe???? Vamos apagar

Apagando uma tabela sem relacionamento

sintaxe: drop table table_name;

drop table funcionario_2024

create table funcionario_2024 ( mat_fun  Number(4) constraint func_mat_pk Primary key,
                                nm_fun   varchar(30) constraint func_nm_Nn Not null,
                                dt_adm  Date constraint func_dt_nn Not null,
                                salario  Number (8,2),
                                sexo    Char(1) constraint func_sx_nn not null,
                                fk_cargo    number  (4)     constraint func_cargo_fk references cargo);
                                
obs fk:                         columm_name datatype(size) [      constraint      ]  references table_name

references é a criação da  foreign key (fk) ou chave estrangeira

drop table peca
drop table venda




create table peca ( 
id_peca Number(6) constraint peca_id_Pk Primary key,
nm_peca varchar (50) constraint peca_nm_nn1 Not null
                     constraint peca_nm_uk1 unique,
qtd number(6,2) constraint peca_qtd_nn Not null,
preco number(8,2));

create table venda(
n_venda Number(6) constraint venda_n_pk Primary key,
dt_venda Date constraint venda_dt_nn Not null,
total_venda Number(10,2) constraint venda_total_nn Not null);



02/09 
 Aula 2 - criando 1 - 1
 
 Create table pessoa1 (cod_pess1 number(3) primary key,
                       nm_pess1 varchar(30) not null);
                       
 Create table pessoa2 (cod_pess2 number(3) primary key,
                       nm_pess2 varchar(30) not null,
                       fk_pess number(3) unique references pessoa1);
                       
 DML - Alteração de estrutura - tabela
 
 sintaxe: alter table table_name.....
 variações: incluir coluna:             add column_name
            incluir constraint:         add constraint constraint_name
            modificar tipo de dados:    modify
            modificar tamanho:          modify
            apagar coluna:              drop column column_name
            apagar constraint:          drop constraint constraint_name
            renomear coluna:            rename column
            
drop table teste cascade constraints;            
            
create table teste (nome number(4));            

- incluir na tabela teste a coluna código de tipo numérica com 4 posições.
desc teste;
alter table teste add codigo number(4);

- incuir na coluna código da tabela teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo)
ou

- alterar o tipo de dados da coluna nome para alfanumérico co 30 posições
alter table teste modify nome number(30)
desc teste

- alterar o tamanho da coluna nome para 45 posições
alter table teste modify nome varchar(45)


- apagar a pk da coluna codigo
alter table teste drop constraint teste_cd_pk 
desc teste


- apagar a coluna no codigo da tabela teste.
alter table teste drop column codigo

- renomear a coluna nome para nome_cliente;
alter table teste rename column nome to nome_cliente
desc teste

- incluir a regra not null na coluna nome_cliente
alter table teste add constraint teste_nome_nn not null (nome_cliente)
desc teste 

alter table teste modify nome_cliente varchar(45) constraint teste_nome_nn not null


DML - Data Manipulation Language - Dados

Novas linhas 
sintaxe: insert into table_name values (value_column1,......, value_columnN);
         insert into table_name (name_column1,......., name_columnN)
         values (value_column1,......, value_columnN);
         
         desc cargo
insert into cargo values(2000, 'prog. Java', 10000);
=-
insert into cargo values(3000, 'DBA', 12500.80);
insert into cargo values(4000, 'CEO', 25000);
insert into cargo values(5000, 'Adm Redes', 8500);
insert into cargo values(6000, 'Estágio', 33000);

insert into cargo values(7000, 'Adm. Seg', null)
select * from cargo
commit;

create table tipo ( cd_tipo number(4) constraint tipo_cd_pk Primary key,
                    nm_tipo varchar(40) constraint tipo_nm_nn Not null)    
                    
create table compra (   cd_compra number(4) constraint comp_cd_pk Primary key,
                        dt_compra date constraint comp_dt_nn Not Null)
                        
create table Comp_Prod_tem (    cd_compra number(4) constraint compra_comp_cd_fk references compra,
                                cd_prod number(6)constraint produto_prod_cd_fk references produto)
                
                

create table produto (  cd_prod number(6) constraint prod_cd_pk Primary Key,
                        nm_prod varchar(40) constraint prod_nm_nn Not null,
                        fk_tipo number(4) constraint prod_tipo_fk references tipo)
                        



commit








- alterar o tipo de dados da coluna nome para alfanumérico com 30 posições
alter table teste modify nome varchar(30);

- alterar o tamanho da coluna nome para 45 posições
alter table teste modify nome varchar(45);

- apagar a pk da coluna código
alter table teste drop constraint teste_cd_pk;

- apagar a coluna na código da tabela teste.
alter table teste drop column codigo;

-renomear a coluna nome para nome_cliente.
alter table teste rename column nome to nome_cliente;

- incluir a regra not null na coluna nome_cliente.
alter table teste add constraint teste_nome_nn not null (nome_cliente);
- cuidado, existe uma pegadinha com not null
alter table teste modify nome_cliente varchar(45) 
constraint teste_nome_nn not null;

DML - Data Manipulation Language - Dados

Novas linhas 
sintaxe: insert into table_name values (value_column1,......, value_columnN);
         insert into table_name (name_column1,......., name_columnN)
         values (value_column1,......, value_columnN);

usando nulo = null
dados não numéricos precisam de ''

Exemplificar;

desc cargo
insert into cargo values (1,'prog. JAVA', 10000);
-- visualizando dados
select * from cargo;
insert into cargo values (2,'DBA', 12500.80);

incluir os seguintes dados na tabela cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Estágio - 33000

insert into cargo values (3,'CEO', 25000);
insert into cargo values (4,'Adm Redes', 8500);
insert into cargo values (5,'Estágio', 33000);

caso não tenha dados para uma ou mais colunas?????

6 - Adm. Seg - null
select * from cargo;
desc cargo
versão 1: insert into cargo values (6,'Adm. Seg', null);
versão 2: insert into cargo (cd_cargo, nm_cargo) values(7,'Adm Seg');
validando os dados
commit;

Inserir 3 linhas de dados na tabela funcionário a seu critério
desc funcionario_2024;
procurando pelo padrão de data
select sysdate from dual; -- acha a data cadastrada
insert into funcionario_2024 values (1,'Marcel','10-jan-20', 70000,'M',2);
insert into funcionario_2024 values (2,'Joana','20-dec-22',50000,'F',1);
insert into funcionario_2024 values (3,'Ricardo',sysdate,null,'M',6);
commit;
select * from funcionario_2024;
cuidado com os valores de FK, só recebe dados já cadastrado na pk
insert into funcionario_2024 values (4,'Ricardo',sysdate,null,'M',8);

Operadores aritméticos + - * / ()
           relacionais > >= < <= = <> ou !=
           lógicos and or not
           
DML - Atualização de dados

Nosso Sistema

drop table cliente cascade constraints;
drop table vendedor cascade constraints;
drop table produto cascade constraints;
drop table pedido cascade constraints;
drop table item_pedido cascade constraints;

create table cliente
(cod_clie number(4) constraint clie_cd_pk primary key,
nome_clie varchar2(20) constraint clie_no_nn not null,
endereco varchar2(30),cidade varchar2(15),
cep char(8),uf char(2),cnpj char(14),ie char(12));

create table vendedor
(cod_ven number(4) constraint ven_cod_pk primary key,
nome_ven varchar2(20) constraint ven_no_nn not null,
salario_fixo number(12,2),comissao char(1));

create table produto
(cod_prod number(4) constraint prod1_cod_pk primary key,
unidade varchar2(3),descricao varchar2(30),val_unit number(10,2));

create table pedido
(num_pedido number(4) constraint pedido_num_pk primary key,
pr_entrega number(3) constraint entrega_pr_nn not null,
cod_clie references cliente,cod_ven references vendedor);

create table item_pedido
(num_pedido references pedido,
cod_prod references produto,
quant number(10,2));

insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231000134','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','2253412693879','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','1451276498349',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','28315212393488','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','3281698574656','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','234632842349','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','1283512823469','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','3248512673268','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','328482233242','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','1273657123474','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','217635712329','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','1327657112314','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','321765472133','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','2176357612323','2931');
commit;
insert into vendedor values(209,'Jose','1800','C');
insert into vendedor values(111,'Carlos','2490','A');
insert into vendedor values(11,'Joao','2780','C');
insert into vendedor values(240,'Antonio','9500','C');
insert into vendedor values(720,'Felipe','4600','A');
insert into vendedor values(213,'Jonas','2300','A');
insert into vendedor values(101,'Joao','2650','C');
insert into vendedor values(310,'Josias','870','B');
insert into vendedor values(250,'Mauricio','2930','B');
commit;
insert into produto values ('25','KG','Queijo',0.97);
insert into produto values ('31','BAR','Chocolate',0.87);
insert into produto values ('78','L','Vinho',2.00);
insert into produto values ('22','M','Linho',0.11);
insert into produto values ('30','SAC','Acucar',0.30);
insert into produto values ('53','M','Linha',1.80);
insert into produto values ('13','G','Ouro',6.18);
insert into produto values ('45','M','Madeira',0.25);
insert into produto values ('87','M','Cano',1.97);
insert into produto values ('77','M','Papel',1.05);
commit;
insert into pedido values ('121','20','410','209');
insert into pedido values ('97','20','720','101');
insert into pedido values ('101','15','720','101');
insert into pedido values ('137','20','720','720');
insert into pedido values ('148','20','720','101');
insert into pedido values ('189','15','870','213');
insert into pedido values ('104','30','110','101');
insert into pedido values ('203','30','830','250');
insert into pedido values ('98','20','410','209');
insert into pedido values ('143','30','20','11');
insert into pedido values ('105','30','180','240');
insert into pedido values ('111','15','260','240');
insert into pedido values ('103','20','260','11');
insert into pedido values ('91','20','260','11');
insert into pedido values ('138','20','260','11');
insert into pedido values ('108','15','290','310');
insert into pedido values ('119','30','390','250');
commit;
insert into item_pedido values ('121','25','10');
insert into item_pedido values ('121','31','35');
insert into item_pedido values ('97','77','20');
insert into item_pedido values ('101','31','9');
insert into item_pedido values ('101','78','18');
insert into item_pedido values ('101','13','5');
insert into item_pedido values ('98','77','5');
insert into item_pedido values ('148','45','8');
insert into item_pedido values ('148','31','7');
insert into item_pedido values ('148','77','3');
insert into item_pedido values ('148','25','10');
insert into item_pedido values ('148','78','30');
insert into item_pedido values ('104','53','32');
insert into item_pedido values ('203','31','6');
insert into item_pedido values ('189','78','45');
insert into item_pedido values ('143','31','20');
insert into item_pedido values ('143','78','10');
commit;

criando relatórios - DQL

Sintaxe: select * from table_name;
         select column_name1, column_name2,...., column_nameN
         from table_name;
         
Exemplos:
Select * from cliente;
select nome_clie, cidade from cliente;

Criar um relatório que exiba os dados dos vendedores.
select * from vendedor;
Mostre o nome do produto e seu preço.
select descricao, val_unit from produto;

Apelidando as colunas
 - colocar sempre após o nome da coluna
 - para duas ou + palavras usa-se ""
 
 Exemplo:
 select * from vendedor;
 select nome_ven "Nome", salario_fixo "salário vendedor" from vendedor;
 
 Classificando a saída de dados
 Comando Order by column_name type
 Type - asc - crescente - default
      - desc - decrescente
      
 Exemplos:
 select * from vendedor order by nome_ven;
 select * from vendedor order by nome_ven desc;
 
 select * from cliente order by 2;
 select nome_clie, uf from cliente order by 2;
 select nome_clie, uf from cliente order by 2, 1;
 select nome_clie, uf from cliente order by 2, 1 desc;
 
 Filtrando linhas
 comando where = update e delete
 
 select * from cliente;
 
 Exemplos:
 Crie um relatório que exiba os clientes que moram no estado de São Paulo.
 select * from cliente where uf = 'SP';
 Crie um relatório que exiba os clientes que moram no estado de São Paulo, atenção
 as letras maiusculas ou minisculas.
 select * from cliente where uf = 'SP' or uf = 'sp';
 
 Exercícios;
- Mostre os dados da tabela produto.
   select * from produto;
- Mostre os produtos que não custam mais de R$2,00.
   select * from produto where val_unit < 2;
   select * from produto where not val_unit > 2;
- Quem são os vendedores que ganham acima de R$3.500,00? Exiba nome e salário
   classificados pelo salário de forma decrescente.
   select nome_ven, salario_fixo from vendedor
   where salario_fixo > 3500
   order by 2 desc;
- Mostre os pedidos dos clientes de código 130 até 800.
   select * from pedido where cod_clie > 130 and cod_clie < 800;
- Quem são os clientes (nome, uf e ie) que não moram no estado do Rio de Janeiro
   e Minas Gerais e que a inscrição estadual seja menor que 2000?
 select nome_clie, uf, ie from cliente
 where uf != 'RJ' and uf != 'MG' and ie < 2000;
 
 Quais vendedores terão salário maior que R$5.000,00 com um aumento de 10% no salário
 atual? Exiba nome, salário atual e salário rejustado.
 select nome_ven "Nome Vendedor", salario_fixo "Salário Atual",
 salario_fixo * 1.1 "Salário Reajustado"
 from vendedor
 where salario_fixo * 1.1 > 5000 and salario_fixo < 5000

Criar um relatório qe exiba todos os dados dos clientes de código 100 até 600
(inclusive)
select * from cliente whete cod_clie >= 100 and cod_clie <= 600;

select * from cliente where cod_clie between 100 and 600;

Crie um relatório que exiba o nome dos clientes que estejam no intervalo de 'A' até 'P'
select nome_clie from cliente where nome_clie between 'A' and 'Q' ;

Gerar um relatório que mostre o nome do cliente, o estado onde mora, desde que seja do estado: Sp, Rj, Mg

Select nome_clie Nome, uf Estado from cliente where uf = 'SP' or uf = 'RJ' or uf = 'MG';
op. de BD: in(list)
select nome_clie Nome, uf Estado from cliente where uf in('SP','RJ','MG');

CRIE UM RELATORIO QUE MOSTRE OS CLIENTES DE CÓDIGO 870,110,830,157.
SELECT * FROM CLIENTE WHERE COD_CLIE IN(870,110,830,157) ORDER BY 1;

Criar um relatório que mostre os clientes no intervalo de codigo entre 100 e 300 e 300 e 500 e 700;
SELECT * FROM CLIENTE WHERE COD_CLIE BETWEEN 100 AND 300 OR COD_CLIE BETWEEN 500 AND 750;

Quem são os produtos com unidade de medida: Kg, M?
SELECT * FROM PRODUTO WHERE UNIDADE IN('KG','M');
E sem?
SELECT * FROM PRODUTO WHERE UNIDADE NOT IN('KG','M');

Quais pedidos possuem código entre 50 e 150 e sõ dos vendedores de código 209, 101
select * from PEDIDO WHERE NUM_PEDIDO BETWEEN 50 AND 150 AND COD_VEN IN(209,101);
select * from PEDIDO WHERE COD_VEN IN(209,101) AND NUM_PEDIDO BETWEEN 50 AND 150;

nEGAÇÃO: NOT
not between, not in

Criar um relatório que exiba todos os dados dos clientes que nao pertencem ao intervalo de c´pdigo de 100 até 600
select * from cliente where cod_clie not between 100 and 600;

Quem são os clientes qu epossuem em seu nome a letra 'A'
select * from cliente where nome_clie Like '%a%' or nome_clie like '%A%';
FINAL
select * from cliente where nome_clie Like '%a';
INICIO
select * from cliente where nome_clie Like 'A%';

Quem são os clientes que possuem 5 leras em seu nome?
select nome_clie from cliente where nome_clie like '_____';

select nome_clie from cliente where nome_clie like '_a%'

Quem são os clientes que possuem na penúltima posição do seu nome a letra 'A';
SELECT NOME_CLIE FROM CLIENTE WHERE NOME_CLIE LIKE '%a_';

Quem são os clientes que não possuem a letra 'A' em seu nome;
select nome_clie from cliente where nome_clie not like '%a%';

Mostre os clientes que possuem a letra 'i' ou a letra 'o' em seu nome;
select nome_clie from cliente where nome_clie like '%i%' and nome_clie not like '%o%' or nome_clie like '%o%' and nome_clie not like '%i%';

Operadores matemáricos de grupo

Mostre quantos clientes existem na tabela cliente;
select * from cliente;
select cod_clie from cliente;
select count(*) from cliente;

Quantaos clientes são do estado de São Paulo?
select count(UF) from cliente where uf in 'SP';

select max(salario_fixo) "Maior Valor",
min(salario_fixo) "Menos Valor",
avg(salario_fixo) "Média Salarial",
sum(salario_fixo) "Somatória"
from vendedor;
commit;


        