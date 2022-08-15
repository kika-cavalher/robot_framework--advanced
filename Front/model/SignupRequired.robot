*** Settings ***

Resource                                    ../resources/Base.robot
Suite Setup                                 Signup Without Fill Form
Test Teardown                               Finish Session        

Documentation                               Signup Requiser Test Suite

*** Test Cases ***

Name is required
    Alert Span Should Be                    Cadê o seu nome?

LastName is required
    Alert Span Should Be                    E o sobrenome?

E-mail is required
    Alert Span Should Be                    O email é importante também!

Password is required
    Alert Span Should Be                    Agora só falta a senha! 



