*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${register_url}                     ${BASE_URL}

#Check-in point
${element_form}                     css=.signup-form 
${element_home}                     a[href="/profile"]

# Forms add
${INPUT_EMAIL}                      id=email
${INPUT_PASS}                       id=password 
${btn_signin_submit}                css=.submit-button >> text=Entrar

# Validation
${msg_validation_register}          css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
${msg_span_error}                   css=span[class=error]
${msg_error_title}                  id=swal2-title
${msg_error_content}                id=swal2-html-container
${msg_validation_register}          css=p >> text=Agor
