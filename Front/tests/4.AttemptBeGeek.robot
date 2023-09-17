*** Settings *** 
Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/0.default/Helpers.robot
Resource                                    ../resources/4.geeks/meta.robot

Test Setup                                  Start Session For Attempt Be geek
#Não foi preciso manter esse gancho pois o screen shot foi colocado dentro do teste para tirar foto em cada tentativa e não só no final.
#Test Teardown                              Finish Session        

Documentation                               Geek Attempt Test Suite

*** Test Cases ***

#Implementação do cenarios de attempty criado alterando o dictionary.
Should Not Be a Geek
    [Template]                               Attempt Be a Geek

# Descrição regras
    desc                                     ${short_desc}                         A descrição deve ter no minimo 80 caracteres
    desc                                     ${empty_desc}                         Informe a descrição do seu trabalho
    desc                                     ${long_desc}                          A descrição deve ter no máximo 255 caracteres

# Wpp regras
    whats                                    ${empty_whats}                        O Whatsapp deve ter 11 digitos contando com o DDD
    whats                                    ${empty_ddd}                          O Whatsapp deve ter 11 digitos contando com o DDD
    whats                                    ${empty_phone}                        O Whatsapp deve ter 11 digitos contando com o DDD

# Valor hora regras
    cost                                     ${letter_cost}                        Valor hora deve ser numérico
    cost                                     ${alphaNumber_cost}                   Valor hora deve ser numérico
    cost                                     ${specialCarac_cost}                  Valor hora deve ser numérico
    cost                                     ${empty_cost}                         Valor hora deve ser numérico

