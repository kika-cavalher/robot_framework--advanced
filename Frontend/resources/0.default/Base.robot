*** Settings ***
Documentation                              Base Test

Library                                    Browser
Library                                    Collections

Resource                                  ./Database.robot  
Resource                                  ./Helpers.robot


*** Variables ***
${BASE_URL}                                https://web-geek.fly.dev


*** Keywords ***
Start Session
    New Browser                     chromium                        headless=True                          
    ...                             slowMo=00:00:00
    New Page                        ${BASE_URL}
    Set Viewport Size                       1280                            768

Finish Session
    Take Screenshot                 fullPage=True