*** Settings ***

Documentation                Session Actions
Resource                     ../../default/Base.robot
Resource                     ../../routes/SessionsRoute.robot

Library    String

*** Keywords ***
#validate status codes
User Signup
    [Arguments]                     ${user} 
    ${response}                     POST Session                      ${user}
    ${response}                     POST User                         ${user}
Del User
    DELETE User

Get data User
    [Arguments]                      ${user} 
    POST User                        ${user}
    GET User

Tests signup status code 200 
    ${user}                          Factory User                      signin
    ${response}                      POST Session                      ${user}
    Status Should Be                 200                               ${response}


Tests signup status code 201 
    ${user}                          Factory User                      signin
    
    DELETE User                      
    ${response}                      POST User                         ${user}
    Status Should Be                 201                               ${response}


Tests signup status code 401 
    ${user}                          Factory User                      signin
    ${response}                      POST Session                      ${user}
    Status Should Be                 401                               ${response}


Tests signup right user
    ${user}                           Factory User                     signin           
    POST User                         ${user}
    ${response}                       GET User 
    Should Be Equal As Strings        ${user}[name]                    ${response.json()}[name]
    Should Be Equal As Strings        ${user}[email]                   ${response.json()}[email]
    Should Be Equal As Strings        None                             ${response.json()}[whatsapp]
    Should Be Equal As Strings        None                             ${response.json()}[avatar]
    Should Be Equal As Strings        False                            ${response.json()}[is_geek]

Test id Required
    ${user}                           Factory User                      signin
    
    Del User
    ${response}                       POST User                         ${user}
    ${user_id}                        Set Variable                      ${response.json()}[id]
    
    Should Be True                    ${user_id} > 0

