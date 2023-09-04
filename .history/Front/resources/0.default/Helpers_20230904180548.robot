*** Settings *** 

Documentation                               Test Helpers

Resource                                    ./Base.robot
Resource                                    Database.robot 
Resource                                    ../2.signin/meta.robot     

*** Keywords ***
Add User From Database
    [Arguments]                              ${user}

    Connect To Postgress
    Insert User                              ${user}
    Disconnect From Database

Do Login
    [Arguments]                              ${user}

    Go to Login form
    Fill Credentials                        ${user}
    Submit Credentials
    User shold Be Logged in                 ${user}  

