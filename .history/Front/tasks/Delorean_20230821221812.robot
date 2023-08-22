# robot -l NONE ./Front/tasks/Delorean.robot                      --> Para gerar uma execução sem output (test) somente tarefas. 

*** Settings ***
Documentation                               Delorean

Resource                                    ../resources/0.default/Base.robot

*** Tasks ***
Back To The Past

    Connect To Postgress
    Reset Env
    Users Seed
    Disconnect from Database