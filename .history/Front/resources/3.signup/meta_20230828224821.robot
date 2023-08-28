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

# Essa keyord da library Brwser: Get Elements -- Captura todos os elementos iguais e cria uma lista. (Por isso não precisa do 
    ${spans}                                        Get Elements                                                 ${msg_span_error}

# Laço de repetição. Precisa inicializar e finalizar com o END
# Primeiro Span são os elementos encontrados com o mesmo identificador, mas são eles individualmente.
# @spans é a lista inteira criada acima com os mesmo identificador (lenght).
    FOR    ${span}   IN    @{spans}

# Isso vai fazer com que cada frase criado ao chamar o metodo, independente de quantas se juntem e vire uma lista. 
           ${text}                                  Get Text                                                     ${span}
           Append To List                           ${got_alerts}                                                ${text} 
    END

# Primeiro juntou tudo em uma lista usando o FOR (assim não precisa ficar fixo o valor podendo usar em outras situações)
# Agora vai usar essa lista para validar frase por frase se é a frase esperada para o elemento definido no Signup(file)
    Lists Should Be Equal                           ${expected_alerts}                                           ${got_alerts}