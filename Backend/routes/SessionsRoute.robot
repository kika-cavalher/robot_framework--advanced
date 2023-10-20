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
    ${result}               Set Variable                      ${EMPTY}

    IF    "200" in "${response}"
        ${result}            Set Variable                     ${response.json()}[token]
    END

    [Return]                ${result}

DELETE User 
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}
    
    IF   "${token}"
          ${response}             DELETE                   
          ...                     ${API_USERS_URL}/users
          ...                     headers=${headers}    
          ...                     expected_status=any
    END
    
    [Return]                ${response}

GET User
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}

    ${response}             GET                   
    ...                     ${API_USERS_URL}/users
    ...                     headers=${headers}    
    ...                     expected_status=any
    
    [Return]                ${response}


PUT User 
    [Arguments]             ${user}
    ${token}                Token User
    ${headers}              Create Dictionary                Authorization=Bearer ${token}

    ${response}             PUT                   
    ...                     ${API_USERS_URL}/users
    ...                     json=${user}   
    ...                     headers=${headers}        
    ...                     expected_status=any
    
    [Return]                ${response}
