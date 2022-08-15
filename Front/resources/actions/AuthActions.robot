*** Settings ***
Resource                                          ../Base.robot

Documentation                                     Authentication Actions

*** Keywords ***
Go to Login form
    Go To                                          ${BASE_URL}
    Wait For Elements State                        css=.signup-form                                            visible

Fill Credentials
    Go To                                          ${BASE_URL}

Submit Credentials
    Go To                                          ${BASE_URL}

User shold Be Logged in
    Go To                                          ${BASE_URL}

