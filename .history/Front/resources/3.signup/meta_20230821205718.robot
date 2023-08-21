*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource

*** Keywords ***
Go to Signup form
    Go To                                          ${register_url}
    Wait For Elements State                        ${element_form}                                            visible                         5

Fill Signup form
    [Arguments]                                    ${user}

    Fill Text                                      id=name                                                     ${user}[name]
    Fill Text                                      id=lastname                                                 ${user}[lastname]
    Fill Text                                      id=email                                                    ${user}[email]
    Fill Text                                      id=password                                                 ${user}[password]

Submit Signup Forms
    Click                                          css=.submit-button >> text=Cadastrar

User Should Be Registered
    ${expect_message}                              Set Variable                                                css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.

    Wait For Elements State                        ${expect_message}                                           visible                         5

Modal title Shoud Be
    [Arguments]                                    ${expect_title}
    ${title}                                       Set Variable                                                css=.swal2-title

    Wait For Elements State                        ${title}                                                    visible                         5
    Get Text                                       ${title}                                                    equal                           ${expect_title} 

Signup With Short Pass
    [Arguments]                             ${short_pass}
    ${user}                                 Create Dictionary
    ...                                     name=Erica                             lastname=Cavalher
    ...                                     email=erica.cavalher@gmail.com          password=${short_pass}

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Alert Span Should Be                    Informe uma senha com pelo menos 6 caracteres


Signup Without Fill Form

    Start Session
    Go to Signup form
    Submit Signup Forms
