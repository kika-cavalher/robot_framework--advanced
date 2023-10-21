*** Settings ***

Documentation                Session GEEK route 
Resource                     ../default/Base.robot
Resource                     SessionsRoute.robot

*** Keywords ***
#Geek endpoint
POST Geek
    [Arguments]             ${user}
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}

    ${response}             POST                   
    ...                     ${API_USERS_URL}/geeks
    ...                     json=${user}   
    ...                     headers=${headers}        
    ...                     expected_status=any
    
    [Return]                ${response}

GET Geeks
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}

    ${response}             GET                   
    ...                     ${API_USERS_URL}/geeks 
    ...                     headers=${headers}        
    ...                     expected_status=any
    
    [Return]                ${response}