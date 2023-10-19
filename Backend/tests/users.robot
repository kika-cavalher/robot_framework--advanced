*** Settings ***

Documentation                                    Session route test suite
Resource                                         ../resources/signup/meta.robot
Resource                                         ../default/Base.robot
Resource                                         ../routes/SessionsRoute.robot

Test Setup                                        Reset All 
*** Test Cases ***
Add new user
    [Tags]                                       happy_way
    ${user}                                      Factory User                       signin

    User Signup                                  ${user}   
    Tests signup status code 201     
    Test id Required                  

User data
    [Tags]                                       happy_way
    ${user}                                      Factory User                       signin
    
    Get data User                                ${user}
    Tests signup status code 200    
    Tests signup right user   
