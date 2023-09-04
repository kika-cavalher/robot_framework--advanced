*** Settings *** 
Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/0.default/Helpers.robot
Resource                                    ../resources/4.geeks/meta.robot

Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Geek Test Suite

*** Test Cases ***
Be a Geek
    [Tags]                                  happy_way

    ${user}                                 Factory User Be Geek

#Minha primeira pré condição é ter um cliente cadastrado e estar logado (Criei o cadastro no seeds direto no banco e o login no arquivo helpers.)
    Do Login                                ${user} 
#Agora posso focar no teste que é o cadastro do geek
    Go to Geek form
    Fill Geek Forms






