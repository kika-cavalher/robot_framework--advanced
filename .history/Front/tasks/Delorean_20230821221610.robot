# robot -l NONE                       --> Para gerar uma 

*** Settings ***
Documentation                               Delorean

Resource                                    ../resources/0.default/Base.robot

*** Tasks ***
Back To The Past

    Connect To Postgress
    Reset Env
    Users Seed
    Disconnect from Database