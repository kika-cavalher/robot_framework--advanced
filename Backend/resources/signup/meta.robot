*** Settings ***

Documentation                Session Actions
Resource                     ../../default/Base.robot
Resource                     ../../routes/SessionsRoute.robot

Library    String

*** Keywords ***
#validate status codes
User Signup
    [Arguments]             ${user} 
    ${response}             POST Session                      ${user}
    
    ${response}             POST User               ${user}
    Status Should Be        201                     ${response}

Del User
    DELETE User

Get data User
    [Arguments]             ${user} 
    POST User               ${user}
    GET User

Tests signup status code 200 
    ${user}                 Factory User                      signin
    ${response}             POST Session                      ${user}
    Status Should Be        200                               ${response}

Tests signup status code 401 
    ${user}                 Factory User                      signin
    ${response}             POST Session                      ${user}
    Status Should Be        401                               ${response}


Tests signup right user
    ${user}                           Factory User              signin           
    POST User                         ${user}
    ${response}                       GET User 
    Should Be Equal As Strings        ${user}[name]            ${response.json()}[name]
    Should Be Equal As Strings        ${user}[email]           ${response.json()}[email]

Test id Required
    [Arguments]             ${user} 
    ${response}             POST User                         ${user}
    ${user_id}              Set Variable                      ${response.json()}[id]

    Should Be True          ${user_id} > 0

