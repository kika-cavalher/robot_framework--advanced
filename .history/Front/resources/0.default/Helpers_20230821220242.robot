*** Settings *** 

Documentation                               Test Helpers
Resource                                    ../resources/3.signup/eta.robot
Resource                                    Database.robot         

*** Keywords ***
Add User From Database
    [Arguments]                            ${user}

    Connect To Postgress
    Insert User                            ${user}
    Disconnect From Database
