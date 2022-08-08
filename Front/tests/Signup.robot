*Settings*

Resource                                    ${EXECDIR}/Front/resources/Base.robot
Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

* Test Cases *

Register a new User
    ${user}                                 Factory User
    Set Suite Variable                      ${user}

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    User Should Be Registered

Duplicate user
    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    Modal title Shoud Be                    Oops...
    Modal Content Shoud Be                  Já temos um usuário com o e-mail informado.