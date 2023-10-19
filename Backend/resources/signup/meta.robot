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
Test id Required
    [Arguments]             ${user} 
    ${response}             POST User                         ${user}
    ${user_id}              Set Variable                      ${response.json()}[id]

    Should Be True          ${user_id} > 0


