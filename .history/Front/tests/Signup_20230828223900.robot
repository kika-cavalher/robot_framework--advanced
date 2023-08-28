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


Wrong Email
    [Tags]                                  attempt_signup

#Array criado via python no arquivo do python Users.py
    ${user}                                 Factory Wrong Email

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Alert Span Should Be                    O email está estranho


 Required Fields SignUp
     [Tags]                                  attempt_signup                                required_fields
    
# O ideal nesse caso não é utilizar o template pois se tiver qualquer erro ou acerto ele vai parar e replicar o erro pelo numero de dados que existe na lista de templates. Melhor para validar somente 1 campo.


     @{expected_alerts}                      Create List
     ...                                     Cadê o seu nome?
     ...                                     E o sobrenome?
     ...                                     O email é importante também!
     ...                                     Agora só falta a senha! 

     Go to Signup form
     Submit Signup Forms
     Alert Spans Should Be                   ${expected_alerts}     
