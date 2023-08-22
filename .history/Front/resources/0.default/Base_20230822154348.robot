*** Settings ***
Documentation                              Base Test

Library                                    Browser

Resource                                  ./_SharedActions.robot
Resource                                  ./Database.robot  
Resource                                  ./Helpers.robot


*** Variables ***
${BASE_URL}                                 https://web-geek.fly.dev


*** Keywords ***
Start Session
    Browser.New Browser                             chromium                        headless=False                          slowMo=00:00:00.5
    Browser.New Page                                ${BASE_URL}

Finish Session
    Take Screenshot