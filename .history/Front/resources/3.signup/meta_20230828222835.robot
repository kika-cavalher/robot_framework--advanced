*** Settings ***
Documentation                                     Signup Actions Tests

Library                                           Collections

Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Signup form
    Go To                                          ${register_url}
    Wait For Elements State                        ${element_form}                                             visible                         5

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

Alert Span Should Be
    [Arguments]                                    ${expect_alert}

    Wait For Elements State                        ${msg_span_error}                                           visible                         5
    Get Text                                       ${msg_span_error}                                           equal                           ${expect_alert}                                        

Modal title Shoud Be
    [Arguments]                                    ${expect_title}

    Wait For Elements State                        ${msg_error_title}                                          visible                         5
    Get Text                                       ${msg_error_title}                                          equal                           ${expect_title} 

Modal Content Shoud Be
    [Arguments]                                    ${expect_content}

    Wait For Elements State                        ${msg_error_content}                                         visible                        5
    Get Text                                       ${msg_error_content}                                         equal                          ${expect_content}


#Attempt scenarios
Signup With Short Pass
    [Arguments]                                     ${short_pass}
    #Create dictionary é a keyword que serve para definir que essa massa é uma json(uma lista igual do arquivo user.py).
    ${user}                                         Create Dictionary
    ...                                             name=Erica                                                 lastname=Cavalher
    ...                                             email=erica.cavalher@gmail.com                             password=${short_pass}
    # essa lista de password (que vai mudar no campo que tem a variavel criada) está definido no arquivo Signups e gera varios testes mudando somente esse mapo com a opção template

    Go to Signup form
    #Está puxando o dictionary criado acima.
    Fill Signup form                                ${user} 
    Submit Signup Forms
    Alert Span Should Be                            Informe uma senha com pelo menos 6 caracteres


Alert Spans Should Be 
    [Arguments]                                     ${expected_alerts}

# Inciando a variavel com @ cria a lista e o comando Create list inseri itens na lista 
# Append To List e Lists Should Be Equal Vem da Library Collections.

    @{got_alerts}                                   Create List   
    ${spans}                                        Get Elements                                                 ${msg_span_error}

# Laço de repetição. Precisa inicializar e finalizar com o END
# Primeiro Span é a lista 
    FOR    ${span}   IN    @{spans}

           ${text}                                  Get Text                                                     ${span}
           Append To List                           ${got_alerts}                                                ${text} 
    END

    Lists Should Be Equal               ${expected_alerts}                                           ${got_alerts}