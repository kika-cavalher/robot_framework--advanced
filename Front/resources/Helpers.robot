*** Settings *** 

Documentation                               Test Helpers
Resource                                    Actions.robot        

*** Keywords ***
Add User
    [Arguments]                            ${user}

    Go to Signup form
    Fill Signup form                       ${user}
    Submit Signup Forms
    User Should Be Registered