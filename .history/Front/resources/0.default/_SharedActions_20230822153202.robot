*** Settings ***
Documentation                                Shared Actions

Resource                                     ./Base.robot
Library                                        Collections

*** Keywords ***
Modal Content Shoud Be
    [Arguments]                              ${expect_text}
    ${content}                               Set Variable                      css=.swal2-html-container

    Wait For Elements State                  ${content}                        visible                           5
    Get Text                                 ${content}                        equal                             ${expect_text} 

Alert Span Should Be
    [Arguments]                                    ${expect_alert}

    Wait For Elements State                        css=span[class=error] >> text=${expect_alert}        
    ...                                            visible                                                       5

Alert Spans Should Be 
    [Arguments]                                    ${expected_alerts}
    
    @{got_alerts}                                   Create List   
    ${spans}                                        Get Elements                                                 xpath=//span[@class="error"]

    FOR    ${span}   IN    @{spans}

           ${text}             Get Text             ${span}
           Append To List      ${got_alerts}        ${text} 
    END

    Lists Should Be Equal      ${expected_alerts}     ${got_alerts}