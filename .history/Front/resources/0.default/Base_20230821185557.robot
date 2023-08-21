*** Settings ***

Documentation                               Base Test
Library                                     Browser

# Library                                   ../0.1factories/Users.py

# Resource                                  ./_SharedActions.robot
# Resource                                  ./Database.robot  
# Resource                                  ./Helpers.robot
# Resource                                  ../1.signup/SignupActions.robot
# Resource                                  ../2.signin/AuthActions.robot


*** Variables ***
${BASE_URL}                                 https://web-geek.fly.dev/


*** Keywords ***
Start Session
    New Browser                             chromium                        headless=False                          slowMo=00:00:01
    New Page                                ${BASE_URL}

Finish Session
    Take Screenshot