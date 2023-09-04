*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Geek form
    Click                                          ${btn_be_geek}                                            visible                         5

#Add
Fill Geek form
    [Arguments]                                    ${user}

    Fill Text                                      ${form_add_name}                                            ${user}[name]
    Fill Text                                      ${form_add_lastname}                                        ${user}[lastname]
    Fill Text                                      ${form_add_email}                                           ${user}[email]
    Fill Text                                      ${form_add_password}                                        ${user}[password]

Submit Signup Forms
    Click                                          ${btn_form_add_submit}


#Validate