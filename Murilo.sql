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







        