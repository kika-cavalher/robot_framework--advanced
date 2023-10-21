*** Settings ***

Documentation                Session Actions
Resource                     ../../default/Base.robot
Resource                     ../../routes/SessionsRoute.robot
Resource                     ../../routes/BeGeekRoute.robot

*** Keywords ***
#validate status codes

Become a geek
    [Arguments] 
    
    ${user_signin}                  Factory User                                            signin
    ${user_geek}                    Factory Geek                                   
    ${response}                     POST User                                               ${user_signin}

    POST Geek                       ${user_geek}[be_geek][geek_profile]


Tests right user and geek
    ${user_signin}                    Factory User                                          signin
    ${user_geek}                      Factory Geek                                 
    POST User                         ${user_signin}
    ${response}                       GET User
    ${coast_expected}                 Convert To Number                                     ${user_geek}[be_geek][geek_profile][cost]               
    ${coast_response}                 Convert To Number                                     ${response.json()}[cost]               

    Should Be Equal As Strings        ${user_geek}[be_geek][name]                           ${response.json()}[name]
    Should Be Equal As Strings        ${user_geek}[be_geek][email]                          ${response.json()}[email]
    Should Be Equal As Strings        ${user_geek}[be_geek][geek_profile][whatsapp]         ${response.json()}[whatsapp]
    Should Be Equal As Strings        ${user_geek}[be_geek][geek_profile][desc]             ${response.json()}[desc]
    Should Be Equal As Strings        ${user_geek}[be_geek][geek_profile][printer_repair]   ${response.json()}[printer_repair]
    Should Be Equal As Strings        ${user_geek}[be_geek][geek_profile][work]             ${response.json()}[work]
    Should Be Equal As Strings        ${coast_expected}                                     ${coast_response}   
 
Tests geeks status code 200 
    ${user_signin}                    Factory User                                 signin                                
    POST User                         ${user_signin}
    ${response}                       GET User
    Status Should Be                  200                                          ${response}


Get Geek List
    ${user_signin}                    Factory User                                 signin
    ${user_geek}                      Factory Geek                                 
    POST User                         ${user_signin}
    POST Geek                         ${user_geek}[be_geek][geek_profile]
    
    GET Geeks

Test confirm geek list
    ${user_signin}                    Factory User                                 signin
    ${user_geek}                      Factory Geek
    POST User                         ${user_signin}
    POST Geek                         ${user_geek}[be_geek][geek_profile]
    ${response}                       GET Geeks
    
    ${total}                          Get Length                                   ${response.json()}[Geeks]
    Should Be True                    ${total}>0        

    

Test confirm geek list -fix
    ${data}                           Factory Geek
    ${user_signin}                    Factory User                                 signin

    FOR    ${geek}    IN    ${data}[list_geeks] 
            POST User                ${geek}
            POST Geek                ${geek}[geek_profile]
        
    END 

    POST User                         ${user_signin} 
    ${response}                       GET Geeks

    ${total}                          Get Length                                   ${response.json()}[Geeks]
    Should Be True                    ${total}>0        

    




