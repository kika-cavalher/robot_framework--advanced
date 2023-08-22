*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
Go to Signup form
    Go To                                          ${register_url}
    Wait For Elements State                        ${element_form}                                             visible                         5

Fill Signup form
    [Arguments]                                    ${user}

    Fill Text                                      ${form_add_name}                                            ${user}[name]
    Fill Text                                      ${form_add_lastname}                                        ${user}[lastname]
    Fill Text                                      ${form_add_email}                                           ${user}[email]
    Fill Text                                      ${form_add_password}                                        ${user}[password]

Submit Signup Forms
    Click                                          ${btn_form_add_submit}

User Should Be Registered
    Wait For Elements State                        ${msg_validation_register}                                  visible                         5

Modal title Shoud Be
    [Arguments]                                    ${expect_title}

    Wait For Elements State                        ${msg_error_title}                                          visible                         5
    Get Text                                       ${msg_error_title}                                          equal                           ${expect_title} 

Modal Content Shoud Be
    [Arguments]                                    ${expect_content}

    Wait For Elements State                        ${msg_error_content}                                          visible                         5
    Get Text                                       ${msg_error_content}                                          equal                           ${expect_content}

Signup With Short Pass
    [Arguments]                                     ${short_pass}
    ${user}                                         Create Dictionary
    ...                                             name=Erica                                                 lastname=Cavalher
    ...                                             email=erica.cavalher@gmail.com                             password=${short_pass}

    Go to Signup form
    Fill Signup form                                ${user}
    Submit Signup Forms
    Alert Span Should Be                            Informe uma senha com pelo menos 6 caracteres


# Signup Without Fill Form

#     Start Session
#     Go to Signup form
#     Submit Signup Forms
