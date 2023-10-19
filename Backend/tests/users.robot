*** Settings ***

Documentation                                    Session route test suite
Resource                                         ../resources/signup/meta.robot
Resource                                         ../default/Base.robot
Resource                                         ../routes/SessionsRoute.robot
    
*** Test Cases ***
Add new user
    [Tags]                                       happy_way
    ${user}                                      Factory User                       signin

    Del User
    User Signup                                  ${user}   
    Tests signup status code 201                  
