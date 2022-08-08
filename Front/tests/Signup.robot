*Settings*
Resource                                    ${EXECDIR}/Front/resources/Base.robot
Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

*Test Cases*

Register a new User
    ${user}                                 Factory User

    Go to Signup form
    Fill Signup form                        ${user}
    Submit Signup Forms
    User Should Be Registered

