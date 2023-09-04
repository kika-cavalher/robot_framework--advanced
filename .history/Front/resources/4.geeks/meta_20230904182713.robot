*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Geek form
    Click                                          ${btn_be_geek}                                      
    Wait For Elements State                        ${element_form}
    ...                                            visible                              5
    ...     

#Add
Fill Geek Forms
    [Arguments]                                    ${geek_profile}

    Fill Text                                  ${input_whats}                       ${geek_profile}[whats]
    Fill Text                                  ${input_whats}                       ${geek_profile}[whats]
    Fill Text                                  ${input_whats}                       ${geek_profile}[whats]
    Fill Text                                  ${input_whats}                       ${geek_profile}[whats]
    Fill Text                                  ${input_whats}                       ${geek_profile}[whats]
    



#Validate