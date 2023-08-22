*** Settings ***
Resource                                          ../0.default/Base.robot

Documentation                                     Authentication Actions

*** Variables ***
${INPUT_EMAIL}                                    id=email
${INPUT_PASS}                                     id=password 

*** Keywords ***
Go to Login form
    Go To                                          ${BASE_URL}
    Wait For Elements State                        css=.login-form                      visible                        5

Fill Credentials
    [Arguments]                                    ${user}

    Fill Text                                      ${INPUT_EMAIL}                       ${user}[email]
    Fill Text                                      ${INPUT_PASS}                        ${user}[password]

Submit Credentials
    Click                                          css=.submit-button >> text=Entrar

User shold Be Logged in
    [Arguments]                                    ${user}
    ${profile}                                     Set Variable                         a[href="/profile"]
    ${fullName}                                    Set Variable                         ${user}[name] ${user}[lastname]

    Wait For Elements State                        ${profile}                           visible                        5
    Get Text                                       ${profile}                           equal                          ${fullName}

Should Be Type Email
    Get Property                                    ${INPUT_EMAIL} 
    ...                                             type                                 equal                         email