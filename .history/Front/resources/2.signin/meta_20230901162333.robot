*** Settings ***
Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

Documentation                                     Authentication Actions

*** Keywords ***
Go to Login form
    Go To                                          ${BASE_URL}
    Wait For Elements State                        ${element_form}                      visible                        5

Fill Credentials
    [Arguments]                                    ${user}

    Fill Text                                      ${INPUT_EMAIL}                       ${user}[email]
    Fill Text                                      ${INPUT_PASS}                        ${user}[password]

Submit Credentials
    Click                                          ${btn_signin_submit} 

User shold Be Logged in
    [Arguments]                                    ${user}
    ${profile}                                     Set Variable                         ${element_home}
    ${fullName}                                    Set Variable                         ${user}[name] ${user}[lastname]

    Wait For Elements State                        ${profile}                           visible                        5
    Get Text                                       ${profile}                           equal                          ${fullName}

Should Be Type Email
    Get Property                                    ${INPUT_EMAIL} 
    ...                                             type                                 equal                         email