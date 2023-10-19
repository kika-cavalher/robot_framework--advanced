*** Settings ***

Documentation                                    Session route test suite
Resource                                         ../resources/signin/meta.robot
Resource                                         ../default/Base.robot
Resource                                         ../routes/SessionsRoute.robot
    
*** Test Cases ***
User Session Login
    [Tags]                                       happy_way
    ${user_session}                              Factory Session User               session
    ${user_login}                                Factory User                       signin
    POST User                                    ${user_login}                         

    Tests status code 200                        ${user_session}
    Tests Length equal                           ${user_session}
    Test message expired be equal                ${user_session}

Incorrect pass
    [Tags]                                       attempt
    ${user}                                      Factory Session User              incorrect_pass
    
    Tests status code 401                        ${user}
    Test message Unauthorized be equal           ${user}

User not found
    [Tags]                                       attempt
    ${user}                                      Factory Session User              user_not_found
    
    Tests status code 401                        ${user}
    Test message Unauthorized be equal           ${user}

Incorrect email
    [Tags]                                       attempt
    ${user}                                      Factory Session User             incorrect_email
    
    Tests status code 400                        ${user}
    Test message wrong format email be equal     ${user}

Empty email
    [Tags]                                       attempt
    ${user}                                      Factory Session User              empty_email
    
    Tests status code 400                        ${user}
    Test message empty email be equal            ${user}

Without email
    [Tags]                                       attempt
    ${user}                                      Factory Session User              without_email
    
    Tests status code 400                        ${user}
    Test message empty email be equal            ${user}

Empty pass
    [Tags]                                       attempt
    ${user}                                      Factory Session User             empty_pass
    
    Tests status code 400                        ${user}
    Test message empty pass be equal             ${user}

Without pass
    [Tags]                                       attempt
    ${user}                                      Factory Session User            without_pass
    
    Tests status code 400                        ${user}
    Test message empty pass be equal             ${user}

Should Not Get token    
    [Tags]                                       attempts
    [Template]                                   Attempt POST Session

    incorrect_pass                               401                         Unauthorized
    user_not_found                               401                         Unauthorized
    incorrect_email                              400                         Incorrect email
    empty_email                                  400                         Required email
    without_email                                400                         Required email
    empty_pass                                   400                         Required pass
    without_pass                                 400                         Required pass