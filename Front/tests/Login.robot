*** Settings ***

Resource                                    ../resources/Base.robot
Suite Setup                                 Start Session
Test Teardown                               Finish Session        

Documentation                               Login test Suite

*** Test Cases ***

User Login
    [Tags]                                  happy_way
    ${user}                                 Factory User Login
    Add User From Database                  ${user}
    
    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    User shold Be Logged in                 ${user}  