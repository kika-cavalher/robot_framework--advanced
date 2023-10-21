*** Settings ***
Documentation                              Base Test API

Library                                    DatabaseLibrary
Library                                    RequestsLibrary
Library                                    String
Library                                    ./Users.py

*** Variables ***
${API_USERS_URL}                          https://api-geek.fly.dev


*** Keywords ***
Connect To Postgress
    Connect To Database                              psycopg2                                   # vem default para trabalhar com sql e o elepnhtsql
    ...                                              nmtcwbau                                   # user do banco no elephantSql 
    ...                                              nmtcwbau                                   # nome do banco no elephantSql 
    ...                                              BBZLKbd77pBfmQCN1fZHtgC0iw81fI9v           # senha do banco no elephantSql 
    ...                                              trumpet.db.elephantsql.com                 # Server do banco no elephantSql 
    ...                                              5432        
    ...    
Reset All
    Connect To Postgress
    Execute SQL String                               DELETE from public.geeks;                  # Implementar query atraves do robot. 
    Execute SQL String                               DELETE from public.users;  