*** Settings ***

Resource                                    ../resources/Base.robot
Suite Setup                                 Signup Without Fill Form
Test Teardown                               Finish Session        

Documentation                               Login test Suite

*** Test Cases ***

User Login
    [Tags]                                  happy_way

    Go to Login form
    Fill Credentials
    Submit Credentials
    User shold Be Logged in                    