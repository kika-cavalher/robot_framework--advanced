*** Settings ***
Documentation                                     Geek Actions Tests
Resource                                          ../0.default/Base.robot
Resource                                          ./data.robot

*** Keywords ***
#Default
Go to Geek form
    Click                                          ${btn_be_geek}                                      
    Wait For Elements State                        ${element_geek_form}
    ...                                            visible                              5
    ...     

###Add
#Reset Geek Form
#    Execute Javascript                             document.getElementsByClassName("be-geek-form")[0].reset();                     


Fill Geek Forms
    [Arguments]                                    ${geek_profile}
    #Reset Geek Form                                    
    Fill Text                                      ${input_whats}                       ${geek_profile}[whats]
    Fill Text                                      ${input_desc}                        ${geek_profile}[desc]

    IF     '${geek_profile}[printer_repair]'
            Select Options By                      ${input_printer_repair}              value                                ${geek_profile}[printer_repair]
    END

    IF     '${geek_profile}[work]'
            Select Options By                      ${input_work}                        text                                 ${geek_profile}[work]
    END

#Automatizar uma caixa de seleção com a lib browser - Select Options By 

    Fill Text                                      ${input_cost}                        ${geek_profile}[cost]


Submit Geek Form
    Click                                          ${btn_be_geek_submit}

##Validate
User Should Be Registered
    Wait For Elements State                        ${msg_validation_register}
    ...                                            visible                              5

Attempt Be a Geek
    [Arguments]                                    ${key}                               
    ...                                            ${input_field}                       ${output_message}

    ${user}                                        Factory User                         attempt_geek

#Com isso é possivel deixar dinamico testes semelhantes sem precisar refazer o fluxo varias vezes e obter o resultado esperado.
    Set To Dictionary                              ${user}[geek_profile]                
    ...                                            ${key}                               ${input_field}

    Fill Geek Forms                                ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be                           ${output_message}
    Take Screenshot                                fullPage=True


#Como todos os cenarios tem o mesmo inicio o ideal é criar o inicial separado e deixar programado para iniciar todos os casos do arquivo. 
Start Session For Attempt Be geek
    ${user}                                        Factory User                         attempt_geek
    
    Start Session
    Do Login                                       ${user} 
    Go to Geek form
