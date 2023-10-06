***Settings***

Documentation                       Suite with elements HTML for register test
Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${register_url}                     ${BASE_URL}/signup
${register_btn}                     css=a >> text=Cadastre-se

#Check-in point
${element_register_form}            css=.signup-form

# Forms add
${form_add_name}                    id=name
${form_add_lastname}                id=lastname
${form_add_email}                   id=email 
${form_add_password}                id=password 
${btn_form_add_submit}              css=.submit-button >> text=Cadastrar

# Validation
${msg_validation_register}          css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
