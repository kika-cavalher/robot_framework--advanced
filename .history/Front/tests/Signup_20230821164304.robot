*** Settings *** 

Resource                                    ../\0.default\Base.robot
Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

*** Test Cases ***
Register a new User
    [Tags]                                  happy_way

    ${user}                                 Factory User

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    User Should Be Registered

Duplicate user
    [Tags]                                  attempt_signup
    
    ${user}                                 Factory User
    Add User From Database                  ${user}

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Modal title Shoud Be                    Oops...
    Modal Content Shoud Be                  Já temos um usuário com o e-mail informado.

Wrong Email
    [Tags]                                  attempt_signup

    ${user}                                 Factory Wrong Email

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Alert Span Should Be                    O email está estranho

Required Fields SignUp
    [Tags]                                  attempt_signup                                required_fields
    
    @{expected_alerts}                      Create List
    ...                                     Cadê o seu nome?
    ...                                     E o sobrenome?
    ...                                     O email é importante também!
    ...                                     Agora só falta a senha! 

    Go to Signup form
    Submit Signup Forms
    Alert Spans Should Be                   ${expected_alerts}     

Short Password
    [Tags]                                  attempt_signup                                short_pass

    [Template]                              Signup With Short Pass
    1
    a
    12
    a2
    -1
    123
    ab3
    1234
    ab3c
    12345
    a23bc
    acb#1

