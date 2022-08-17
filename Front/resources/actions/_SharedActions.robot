*** Settings ***
Documentation                                Shared Actions

Resource                                     ../Base.robot

*** Keywords ***

Modal Content Shoud Be
    [Arguments]                              ${expect_text}
    ${content}                               Set Variable                      css=.swal2-html-container

    Wait For Elements State                  ${content}                        visible                           5
    Get Text                                 ${content}                        equal                             ${expect_text} 

