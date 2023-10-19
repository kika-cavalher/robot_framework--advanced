*** Settings ***

Documentation                Session Actions
Resource                     ../../default/Base.robot
Resource                     ../../routes/SessionsRoute.robot


*** Keywords ***
#validate status codes
User Signup
    [Arguments]             ${user} 
    ${response}             POST Session                      ${user}
    
    POST User               ${user}

Del User
    DELETE User

Tests signup status code 201 
    Status Should Be        201

Tests signup status code 400 
    Status Should Be        400

Tests signup status code 401 
    Status Should Be        401


#Messages validations
Test signup message wrong format email be equal
    [Arguments]             ${user}    
    ${response}             POST User                 ${user}

    Should Be Equal         Incorrect email           ${response.json()}[error]


Test signup message empty email be equal
    [Arguments]             ${user}    
    ${response}             POST User                 ${user}

    Should Be Equal         Required email            ${response.json()}[error]

Test signup message empty pass be equal
    [Arguments]             ${user}    
    ${response}             POST User                 ${user}
        
    Should Be Equal         Required pass             ${response.json()}[error]
