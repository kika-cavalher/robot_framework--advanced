*** Settings ***
Documentation                                Shared Actions

Library                                      Collections
Resource                                     ./Base.robot

*** Keywords ***

                                            5

Alert Spans Should Be 
    [Arguments]                                     ${expected_alerts}
    
    @{got_alerts}                                   Create List   
    ${spans}                                        Get Elements                                                 xpath=//span[@class="error"]

    FOR    ${span}   IN    @{spans}

           ${text}                                  Get Text                                                     ${span}
           Collections.Append To List               ${got_alerts}                                                ${text} 
    END

    Collections.Lists Should Be Equal               ${expected_alerts}                                           ${got_alerts}