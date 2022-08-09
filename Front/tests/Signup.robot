*** Settings ***

Resource                                    ../resources/Base.robot
Resource                                    ../resources/Actions.robot
Resource                                    ../resources/Helpers.robot
Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

*** Test Cases ***

Register a new User
    ${user}                                 Factory User

    Add User                                ${user}

Duplicate user
    [Tags]                                  dup_email
    ${user}                                 Factory User

    Add User                                ${user}
    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Modal title Shoud Be                    Oops...
    Modal Content Shoud Be                  Já temos um usuário com o e-mail informado.