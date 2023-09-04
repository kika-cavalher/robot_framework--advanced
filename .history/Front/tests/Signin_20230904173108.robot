# robot -d ./Front/.logs ./Front/tests/Signin.robot
# robot -d ./Front/.logs -i happy_way ./Front/tests/Signin.robot
*** Settings ***

Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/2.signin/meta.robot

Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Login test Suite

*** Test Cases ***

User Login
    [Tags]                                  happy_way
    ${user}                                 Factory User Login
    
    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    User shold Be Logged in                 ${user}  

Incorrect Pass
    [Tags]                                  attempt_signin
    ${user}                                 Create Dictionary                            
    ...                                     email=erica.cavalher@gmail.com                   password=abc123

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    Modal Content Shoud Be                  Usuário e/ou senha inválidos.


Incorrect E-mail
    [Tags]                                  attempt_signin
    ${user}                                 Create Dictionary                            
    ...                                     email=erica.cavalher.com                   password=abc123

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    Should Be Type Email

User not found
    [Tags]                                  attempt_signin
    ${user}                                 Create Dictionary                            
    ...                                     email=erica.cavalher@404.com                   password=abc123

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    Modal Content Shoud Be                  Usuário e/ou senha inválidos.

Required Email
    [Tags]                                   attempt_signin
    ${user}                                 Create Dictionary                            
    ...                                     email=${EMPTY}                                password=abc123

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    Alert Span Should Be                    E-mail obrigatório

Required Password
    [Tags]                                   attempt_signin
    ${user}                                 Create Dictionary                            
    ...                                     email=erica.cavalher@gmail.com                password=${EMPTY}    

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    Alert Span Should Be                    Senha obrigatória

Required Fields Login
    [Tags] 
    .                                 attempt_signup
    @{expected_alerts}                      Create List
    ...                                     E-mail obrigatório
    ...                                     Senha obrigatória

    Go to Login form
    Submit Credentials
    Alert Spans Should Be                   ${expected_alerts}     
