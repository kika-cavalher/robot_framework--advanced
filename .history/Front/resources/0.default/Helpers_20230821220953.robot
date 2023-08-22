*** Settings *** 

Documentation                               Test Helpers
Resource                                    ..//resources/Base.robot
Resource                                    Database.robot         

*** Keywords ***
Add User From Database
    [Arguments]                            ${user}

    Connect To Postgress
    Insert User                            ${user}
    Disconnect From Database
