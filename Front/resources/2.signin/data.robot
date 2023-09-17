*Settings*
Documentation                       Suite with elements HTML for login test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${login_url}                        ${BASE_URL}

#Check-in point
${element_form}                     css=.login-form
${element_home}                     a[href="/profile"]

# Forms add
${input_email}                      id=email
${input_pass}                       id=password 
${btn_signin_submit}                css=.submit-button >> text=Entrar