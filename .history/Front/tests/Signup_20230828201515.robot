# robot -d ./Front/.logs ./Front/tests/Signup.robot
# robot -d ./Front/.logs -i happy_way ./Front/tests/Signup.robot

*** Settings *** 

Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/3.signup/meta.robot

Test Setup                                  Start Session
Test Teardown                               Finish Session        
#
Documentation                               Signup Test Suite

*** Test Cases ***
Register a new User
    [Tags]                                  happy_way
    ${user}                                 Factory User

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    User Should Be Registered


Wrong Email
    [Tags]                                  attempt_signup

#Array criado via python no arquivo do python Users.py
    ${user}                                 Factory Wrong Email

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Alert Span Should Be                    O email está estranho


Duplicate user
    [Tags]                                  attempt_signup
    
#Esse metodo está puxando do Helpers.robot que foi feito inserindo um user usando uma query direto no banco. 
    ${user}                                 Factory User
    Add User From Database                  ${user}

#O resto do teste roda normalmente gerando um teste de interface. 
    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Modal title Shoud Be                    Oops...
    Modal Content Shoud Be                  Já temos um usuário com o e-mail informado.


Short Password
    [Tags]                                  attempt_signup                                short_pass

# Template pode receber parametros, que são as variasões de massa de teste. Ele conta os parametros e cria a quantidade de testes igual a quantidade de parametros. 
# E preciso definir no template qual o metodo que ele vai executar e nesse caso foi o caso criado no arquivo meta.
    [Template]                              Signup With Short Pass
    1
    a
    12
    a2
    -1
    123
    ab3
    1234
    ab3c
    12345
    a23bc
    acb#1

 Required Fields SignUp
     [Tags]                                  attempt_signup                                required_fields
    
     @{expected_alerts}                      Create List
     ...                                     Cadê o seu nome?
     ...                                     E o sobrenome?
     ...                                     O email é importante também!
     ...                                     Agora só falta a senha! 

     Go to Signup form
     Submit Signup Forms
     Alert Spans Should Be                   ${expected_alerts}     

