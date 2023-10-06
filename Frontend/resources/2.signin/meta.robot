*** Settings ***
Resource                                          ../0.default/Base.robot
Resource                                          ../0.default/Validations.robot
Resource                                          ./data.robot

Documentation                                     Authentication Actions

*** Keywords ***
#Default
Go to Login form
    Browser.Go To                                  ${login_url}
    Wait For Elements State                        ${element_form}                      
    ...                                            visible                             5

#Add
Fill Credentials
    [Arguments]                                    ${user}

    Fill Text                                      ${input_email}                       ${user}[email]
    Fill Text                                      ${input_pass}                        ${user}[password]

Submit Credentials
    Click                                          ${btn_signin_submit} 

#Validate
User shold Be Logged in
    [Arguments]                                    ${user}
    ${fullName}                                    Set Variable                         ${user}[name] ${user}[lastname]

    Wait For Elements State                        ${element_home}                           
    ...                                            visible                              5
    Get Text                                       ${element_home}                           
    ...                                            equal                                ${fullName}

Should Be Type Email
# Validar que o tipo de campo é email para ver se aparece a mensagem de erro do navegador. 
    Get Property                                   ${input_email} 
    ...                                            type                                
    ...                                            equal                                email
