*** Settings ***

Documentation                               Base Test

Library                                     Browser
Library                                     Collections
# Library                                     ../0.1factories/Users.py

Resource                                    ../
Resource                                    ./actions/AuthActions.robot
Resource                                    ./actions/_SharedActions.robot
Resource                                    Database.robot  
Resource                                    Helpers.robot

*** Variables ***
${BASE_URL}                                 https://getgeeks-erica.herokuapp.com


*** Keywords ***

Start Session
    New Browser                             chromium                        headless=False                          slowMo=00:00:00
    New Page                                ${BASE_URL}

Finish Session
    Take Screenshot