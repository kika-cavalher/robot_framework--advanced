*** Settings *** 

Documentation                              test example
Library                                    Collections

*** Test Cases ***

Work With List

    @{pets}            Create List        Baguera         Lolita
    Append To List     ${pets}            Nika

    FOR    ${i}    IN    @{pets} 
        
        Log To Console    ${i}
        
    END

    @{pets2}          Create List        Baguera         Lolita        Nika

    Lists Should Be Equal    ${pets}    ${pets2}
