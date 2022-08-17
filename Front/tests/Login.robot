*** Settings ***

Resource                                    ../resources/Base.robot
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