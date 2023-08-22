*** Settings ***
Documentation                                       Database Helpers

Library                                            DatabaseLibrary
Library                                            ../1.factories/Users.py

Resource                                           ./Base.robot

*** Keywords ***
#esse metodo conecta ao banco utilizado no projeto. 
Connect To Postgress
    Connect To Database                              psycopg2                                   # vem default para trabalhar com sql e o elepnhtsql
    ...                                              nmtcwbau                                   # user do banco no elephantSql 
    ...                                              nmtcwbau                                   # nome do banco no elephantSql 
    ...                                              BBZLKbd77pBfmQCN1fZHtgC0iw81fI9v           # senha do banco no elephantSql 
    ...                                              trumpet.db.elephantsql.com                 # Server do banco no elephantSql 
    ...                                              5432                                       # porta do banco postgree padrao 


#Faz a limpa no banco e deixa gerado para rodar antes de inicar um teste. 
Reset Env
    Execute SQL String                               DELETE from public.geeks;                  # Implementar query atraves do robot. 
    Execute SQL String                               DELETE from public.users;                  # Implementar query atraves do robot. 

#Insere um user direto pela banco sem precisar adicionar por interfase. 
Insert User
    [Arguments]                                      ${user}
    
    ${hashed_pass}                                   Get Hashed Pass                         ${user}[password]    
    ${query}                                         Set Variable                            INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute Sql String                               ${query}

#Insere um user direto pela banco sem precisar adicionar por interfase. 
Users Seed
    ${user}                                          Factory User Login
    Insert User                                      ${user}  