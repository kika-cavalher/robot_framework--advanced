*** Settings *** 

Documentation                               Test Helpers
Resource                                    ../resources/3.si
Resource                                    Database.robot         

*** Keywords ***
Add User From Database
    [Arguments]                            ${user}

    Connect To Postgress
    Insert User                            ${user}
    Disconnect From Database
