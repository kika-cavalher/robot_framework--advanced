*** Settings *** 

Documentation                               Test Helpers
Resource                                    ./actions/SignupActions.robot
Resource                                    Database.robot         

*** Keywords ***
Add User From Database
    [Arguments]                            ${user}

    Connect To Postgress
    Insert User                            ${user}
    Disconnect From Database

Add User
    [Arguments]                            ${user}

    Go to Signup form
    Fill Signup form                       ${user}
    Submit Signup Forms
    User Should Be Registered