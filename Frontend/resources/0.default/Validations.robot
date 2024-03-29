*** Settings *** 

Documentation                               Test Helpers

Resource                                    ./Base.robot
Resource                                    Database.robot 
Resource                                    ../2.signin/meta.robot     

*** Keywords ***
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



Alert Spans Should Be 
    [Arguments]                                     ${expected_alerts}

# Inciando a variavel com @ cria a lista e o comando Create list inseri itens na lista 
# Append To List e Lists Should Be Equal Vem da Library Collections.

    @{got_alerts}                                   Create List   

# Essa keyord da library Brwser: Get Elements -- Captura todos os elementos iguais e cria uma lista. (Por isso não precisa do @)
    ${spans}                                        Get Elements                                                 ${msg_span_error}

# Laço de repetição. Precisa inicializar e finalizar com o END
# Primeiro span são os elementos encontrados com o mesmo identificador, mas são eles individualmente.
# @spans é a lista inteira criada acima com os mesmo identificador (lenght).
    FOR    ${span}   IN    @{spans}

# Isso vai fazer com que ele capture o texto de cada elementos indivualmente e cria uma lista. Essa lista é a criada acima e incluida pelo FOR
           ${text}                                  Get Text                                                     ${span}
           Append To List                           ${got_alerts}                                                ${text} 
    END

# Primeiro juntou tudo em uma lista usando o FOR (todos os textos que aparecem na tela)
# Agora vai comparar a lista criada no Signup com a lista que acabamos de criar puxando testes automaticamente. 
    Lists Should Be Equal                           ${expected_alerts}                                           ${got_alerts}




*** Variables ***
${msg_span_error}                   css=span[class=error]
${msg_error_title}                  id=swal2-title
${msg_error_content}                id=swal2-html-container
${msg_validation_register}          css=p >> text=Agor
