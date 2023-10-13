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

Token User                        
    ${user}                 Factory Session User              session_token
    ${response}             POST Session                      ${user}
    ${token}                Set Variable
    ...                     ${response.json()}[token]
    

    [Return]                ${token}

DELETE User 
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}

    ${response}             DELETE                   
    ...                     ${API_USERS_URL}/users
    ...                     headers=${headers}    
    ...                     expected_status=any
    
    [Return]                ${response}
