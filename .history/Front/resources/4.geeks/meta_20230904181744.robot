*** Settings ***
Documentation                                     Signup Actions Tests

Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Geek form
    Click                                          ${btn_be_geek}                                       visible                         5
    Wait For Elements State                        ${element_form}
    ...                                            visible 

#Add



#Validate