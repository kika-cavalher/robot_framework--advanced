*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${btn_be_geek}                     css=a[]

#Check-in point
${element_form}                     css=.signup-form 

# Forms add
${form_add_name}                    id=name
${form_add_lastname}                id=lastname
${form_add_email}                   id=email 
${form_add_password}                id=password 
${btn_form_add_submit}              css=.submit-button >> text=Cadastrar

# Validation
${msg_validation_register}          css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
${msg_span_error}                   css=span[class=error]
${msg_error_title}                  id=swal2-title
${msg_error_content}                id=swal2-html-container
${msg_validation_register}          css=p >> text=Agor
