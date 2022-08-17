*** Settings ***
Resource                                          ../Base.robot

Documentation                                     Signup Actions Tests

*** Keywords ***
Go to Signup form
    Go To                                          ${BASE_URL}/signup
    Wait For Elements State                        css=.signup-form                                            visible                         5

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
 

Alert Span Should Be
    [Arguments]                                    ${expect_alert}

    Wait For Elements State                        css=span[class=error] >> text=${expect_alert}        
    ...                                            visible                                                       5

Alert Spans Should Be 
    [Arguments]                                    ${expected_alerts}
    
    @{got_alerts}                                   Create List   
    ${spans}                                        Get Elements                                                 xpath=//span[@class="error"]

    FOR    ${span}   IN    @{spans}

           ${text}             Get Text             ${span}
           Append To List      ${got_alerts}        ${text} 
    END

    Lists Should Be Equal      ${expected_alerts}     ${got_alerts}

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
