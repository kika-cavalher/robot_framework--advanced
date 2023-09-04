# robot -d ./Front/.logs ./Front/tests/Signup.robot
# robot -d ./Front/.logs -i happy_way ./Front/tests/Signup.robot

*** Settings *** 
Library                                     ../resources/1.factories/Users.py

Resource                                    ../resources/0.default/Base.robot
Resource                                    ../resources/4.geeks/meta.robot

Test Setup                                  Start Session
Test Teardown                               Finish Session        

Documentation                               Signup Test Suite

*** Test Cases ***
Register a new Geek
    [Tags]                                  happy_way
