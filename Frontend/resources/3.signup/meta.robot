*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource                                          ../0.default/Validations.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Signup form
    Click                                          ${register_btn}
    Wait For Elements State                        ${element_register_form}                                             visible                         5

#Add
Fill Signup form
    [Arguments]                                    ${user}

    Fill Text                                      ${form_add_name}                                            ${user}[name]
    Fill Text                                      ${form_add_lastname}                                        ${user}[lastname]
    Fill Text                                      ${form_add_email}                                           ${user}[email]
    Fill Text                                      ${form_add_password}                                        ${user}[password]

Submit Signup Forms
    Click                                          ${btn_form_add_submit}


#Validate
User Should Be Registered
    Wait For Elements State                        ${msg_validation_register}                                  visible                         5

Signup With Short Pass
    [Arguments]                                     ${short_pass}
    #Create dictionary é a keyword que serve para definir que essa massa é uma json(uma lista igual do arquivo user.py).
    ${user}                                         Create Dictionary
    ...                                             name=Erica                                                 lastname=Cavalher
    ...                                             email=erica.cavalher@gmail.com                             password=${short_pass}
    # essa lista de password (que vai mudar no campo que tem a variavel criada) está definido no arquivo Signups e gera varios testes mudando somente esse mapo com a opção template

    Browser.Go To                                   ${register_url}
    #Está puxando o dictionary criado acima.
    Fill Signup form                                ${user} 
    Submit Signup Forms
    Alert Span Should Be                            Informe uma senha com pelo menos 6 caracteres