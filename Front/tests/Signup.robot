*** Settings ***

Resource                                    ../resources/Base.robot
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
    Field Notification Should Be            O email está estranho