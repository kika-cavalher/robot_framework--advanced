*** Settings ***

Documentation                                       Database Helpers

Library                                 DatabaseLibrary

*** Keywords ***
Connect To Postgress
    Connect To Database                 psycopg2
    ...                                 wyscmazv
    ...                                 wyscmazv
    ...                                 OgJ9xh2PeLzbgAPYp2jysBrkXxKD2o98
    ...                                 chunee.db.elephantsql.com
    ...                                 5432


Reset Env
    Execute SQL String                 DELETE from public.geeks;
    Execute SQL String                 DELETE from public.users;

Insert User
    [Arguments]                         ${user}
    ${query}                            Set Variable                            INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${user}[password]', false)

    Execute Sql String                  ${query}