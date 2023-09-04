*** Settings *** 
Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/4.geeks/meta.robot

Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

*** Test Cases ***
Be a Geek
    [Tags]                                  happy_way

    ${user}                                 Factory User Be Geek

#Minha primeira pré condição é estar logado
    ${user}                                 Factory User Login
    
    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    User shold Be Logged in                 ${user}  

