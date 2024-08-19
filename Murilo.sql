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





        