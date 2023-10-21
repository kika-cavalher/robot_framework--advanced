*** Settings ***

Documentation                                    Session route test suite
Resource                                         ../resources/beGeek/meta.robot
Resource                                         ../default/Base.robot
Resource                                         ../routes/BeGeekRoute.robot

Test Setup                                        Reset All 
*** Test Cases ***
Be a geek
    [Tags]                                       happy_way

    Become a geek 
    Tests right user and geek

Search for geeks
    [Tags]                                       happy_way

    Get Geek List
    Tests geeks status code 200
    Test confirm geek list