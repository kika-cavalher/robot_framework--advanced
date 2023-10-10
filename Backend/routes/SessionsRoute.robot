*** Settings ***

Documentation                Session route 
Resource                     ../default/Base.robot


*** Keywords ***
#Signup endpoint
POST User 
    [Arguments]             ${user}

    ${response}             POST                   
    ...                     ${API_USERS_URL}/users
    ...                     json=${user}           
    ...                     expected_status=any
    
    [Return]                ${response}

#Signin endpoint
POST Session 
    [Arguments]             ${user}

    ${response}             POST                   
    ...                     ${API_USERS_URL}/sessions
    ...                     json=${user}           
    ...                     expected_status=any
    
    [Return]                ${response}