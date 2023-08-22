*** Settings *** 

Documentation                               Test Helpers
Resource                                    ../3.signup/meta.robot
Resource                                    Database.robot         

*** Keywords ***
Add User From Database
    [Arguments]                            ${user}

    Connect To Postgress
    Insert User                            ${user}
    Disconnect From Database
