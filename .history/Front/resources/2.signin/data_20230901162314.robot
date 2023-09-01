*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${register_url}                     ${BASE_URL}/signup

#Check-in point
${element_form}                     css=.signup-form 
$                     a[href="/profile"]

# Forms add
${INPUT_EMAIL}                      id=email
${INPUT_PASS}                       id=password 
${btn_signin_submit}                css=.submit-button >> text=Entrar
