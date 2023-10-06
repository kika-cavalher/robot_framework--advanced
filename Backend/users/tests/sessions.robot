*** Settings ***

Documentation                                    Session route test suite
Resource                                         ../resources/meta.robot
Library                                          ../default/Users.py
    

*** Test Cases ***
User Session Login
    [Tags]                                       happy_way
    ${user}                                      Factory API User                       session
    
    Tests status code 200                        ${user}
    Tests Length equal                           ${user}
    Test message expired be equal                ${user}

Incorrect pass
    [Tags]                                       attempt
    ${user}                                      Factory API User                       incorrect_pass
    
    Tests status code 401                        ${user}
    Test message Unauthorized be equal           ${user}

User not found
    [Tags]                                       attempt
    ${user}                                      Factory API User                       user_not_found
    
    Tests status code 401                        ${user}
    Test message Unauthorized be equal           ${user}

Incorrect email
    [Tags]                                       attempt
    ${user}                                      Factory API User                       incorrect_email
    
    Tests status code 400                        ${user}
    Test message wrong format email be equal     ${user}

Empty email
    [Tags]                                       attempt
    ${user}                                      Factory API User                       empty_email
    
    Tests status code 400                        ${user}
    Test message empty email be equal            ${user}

Without email
    [Tags]                                       attempt
    ${user}                                      Factory API User                       without_email
    
    Tests status code 400                        ${user}
    Test message empty email be equal            ${user}

Empty pass
    [Tags]                                       attempt
    ${user}                                      Factory API User                       empty_pass
    
    Tests status code 400                        ${user}
    Test message empty pass be equal             ${user}

Without pass
    [Tags]                                       attempt
    ${user}                                      Factory API User                       without_pass
    
    Tests status code 400                        ${user}
    Test message empty pass be equal             ${user}