*** Settings ***
Documentation                                       Database Helpers

Library                                            DatabaseLibrary
Library                                            ../1.factories/Users.py

Resource                                           ./Base.robot

*** Keywords ***
Connect To Postgress
    Connect To Database                              psycopg2                                   # vem default para trabalhar com sql e o elepnhtsql
    ...                                              nmtcwbau
    ...                                              nmtcwbau
    ...                                              BBZLKbd77pBfmQCN1fZHtgC0iw81fI9v
    ...                                              trumpet.db.elephantsql.com
    ...                                              5432


Reset Env
    Execute SQL String                               DELETE from public.geeks;
    Execute SQL String                               DELETE from public.users;

Insert User
    [Arguments]                                      ${user}
    
    ${hashed_pass}                                   Get Hashed Pass                         ${user}[password]    
    ${query}                                         Set Variable                            INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute Sql String                               ${query}

Users Seed
    ${user}                                          Factory User Login
    Insert User                                      ${user}  