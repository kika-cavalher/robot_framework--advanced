*** Settings ***
Resource                                          ../Base.robot

Documentation                                     Authentication Actions

*** Keywords ***
Go to Login form
    Go To                                          ${BASE_URL}
    Wait For Elements State                        css=.login-form                      visible                        5

Fill Credentials
    [Arguments]                                    ${user}

    Fill Text                                      id=email                             ${user}[email]
    Fill Text                                      id=password                          ${user}[password]

Submit Credentials
    Click                                          css=.submit-button >> text=Entrar

User shold Be Logged in
    [Arguments]                                    ${user}
    ${profile}                                     Set Variable                         a[href="/profile"]
    ${fullName}                                    Set Variable                         ${user}[name] ${user}[lastname]

    Wait For Elements State                        ${profile}                           visible                        5
    Get Text                                       ${profile}                           equal                          ${fullName}