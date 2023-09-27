*** Settings *** 
Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/0.default/Helpers.robot
Resource                                    ../resources/4.geeks/meta.robot

#Precisa usar Suite Setup para não ficar incializando em todos o testes e somente 1x para todos. 
Suite Setup                                  Start Session For Attempt Be geek
Test Template                               Attempt Be a Geek
#Não foi preciso manter esse gancho pois o screen shot foi colocado dentro do teste para tirar foto em cada tentativa e não só no final.
#Test Teardown                              Finish Session        

Documentation                               Geek Attempt Test Suite

*** Test Cases ***
# Não vou usar um nome para todos o caso de testes pois defini em cima que será um test usando o template. Assim preciso criar um nome para cada testes.
#Implementação do cenarios de attempty criado alterando o dictionary.
# Descrição- regras
Short desc           desc                                     ${short_desc}                         A descrição deve ter no minimo 80 caracteres
Long desc            desc                                     ${empty_desc}                         Informe a descrição do seu trabalho
Empty Desc           desc                                     ${long_desc}                          A descrição deve ter no máximo 255 caracteres

# Wpp- regras
All Number empty     whats                                    ${empty_whats}                        O Whatsapp deve ter 11 digitos contando com o DDD
DDD empty            whats                                    ${empty_ddd}                          O Whatsapp deve ter 11 digitos contando com o DDD
Just Number empty    whats                                    ${empty_phone}                        O Whatsapp deve ter 11 digitos contando com o DDD

# Valor hora- regras
Cost letters          cost                                     ${letter_cost}                        Valor hora deve ser numérico
Cost Alpha            cost                                     ${alphaNumber_cost}                   Valor hora deve ser numérico
Cost SpecialChars     cost                                     ${specialCarac_cost}                  Valor hora deve ser numérico
Empty Cost            cost                                     ${empty_cost}                         Valor hora deve ser numérico

#Printer- rules
No printer repair     printer_repair                           ${empty_printer}                      Por favor, informe se você é um Geek Supremo

#Modelo trabalho- rules
No work               work                                     ${empty_work}                         Por favor, selecione o modelo de trabalho