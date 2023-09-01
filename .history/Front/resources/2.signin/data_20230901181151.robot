*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${register_url}                     ${BASE_URL}

#Check-in point
${element_form}                     css=.login-form 
${element_home}                     a[href="/profile"]

# Forms add
${input_email}                      id=email
${input_pass}                       id=password 
${btn_signin_submit}                css=.submit-button >> text=Entrar

# Validation
${msg_error_content}                id=swal2-html-container
${msg_span_error}                   css=span[class=error]
