*** Settings ***

Documentation                Session Actions
Resource                     ../../default/Base.robot
Resource                     ../../routes/SessionsRoute.robot


*** Keywords ***
#validate status codes
User Signup
    ${user}                                Factory API User               signin
    
    POST User                              ${user}

Tests signup status code 200 
    [Arguments]             ${user}   
    
    ${response}             POST User           ${user}
    Status Should Be        200                 ${response}

Tests signup status code 400 
    [Arguments]             ${user}    
    ${response}             POST User           ${user}

    Status Should Be        400                 ${response}

Tests signup status code 401 
    [Arguments]             ${user}    
    ${response}             POST User           ${user}

    Status Should Be        401                 ${response}


#Messages validations
Test signup message wrong format email be equal
    [Arguments]             ${user}    
    ${response}             POST User           ${user}

    Should Be Equal         Incorrect email        ${response.json()}[error]


Test signup message empty email be equal
    [Arguments]             ${user}    
    ${response}             POST User           ${user}

    Should Be Equal         Required email         ${response.json()}[error]

Test signup message empty pass be equal
    [Arguments]             ${user}    
    ${response}             POST User           ${user}
        
    Should Be Equal         Required pass          ${response.json()}[error]
