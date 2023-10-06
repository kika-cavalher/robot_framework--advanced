*** Settings ***

Documentation                Session route Actions
Resource                     ../default/Base.robot
Resource                     ./data.robot


*** Keywords ***
POST Session 
    [Arguments]             ${user}

    ${response}             POST                   
    ...                     ${session_users_url}          
    ...                     json=${user}           
    ...                     expected_status=any
    
    [Return]                ${response}

#validate status codes
Tests status code 200 
    [Arguments]             ${user}   
    
    ${response}             POST Session           ${user}
    Status Should Be        200                    ${response}

Tests status code 400 
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Status Should Be        400                    ${response}

Tests status code 401 
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Status Should Be        401                    ${response}


#Messages validations
Test message expired be equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Should Be Equal         10d                    ${response.json()}[expires_in]

Test message Unauthorized be equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Should Be Equal         Unauthorized           ${response.json()}[error]

Test message wrong format email be equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Should Be Equal         Incorrect email        ${response.json()}[error]


Test message empty email be equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}

    Should Be Equal         Required email         ${response.json()}[error]

Test message empty pass be equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}
        
    Should Be Equal         Required pass          ${response.json()}[error]



#Others validations
Tests Length equal
    [Arguments]             ${user}    
    ${response}             POST Session           ${user}
    ${size}                 Get Length             ${response.json()}[token]
    ${expected_size}        Convert To Integer     140
    
    Should Be Equal         ${expected_size}       ${size}


Attempt POST Session
    [Arguments]              ${user_db}                
    ...                      ${status_code}        ${error_message}
    
    ${user}                  Factory API User      ${user_db}    
    ${response}              POST Session          ${user}
    
    Status Should Be         ${status_code}        ${response}
    Should Be equal          ${error_message}      ${response.json()}[error]
