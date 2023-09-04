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

                                      ${user}[password]

Submit Signup Forms
    Click                                          ${btn_form_add_submit}


#Validate