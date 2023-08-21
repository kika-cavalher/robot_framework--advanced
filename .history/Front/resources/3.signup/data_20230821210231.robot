*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
${register_url}                     ${BASE_URL}/signup
${element_form}                     css=.signup-form 

# Forms add
${form_add_}                     id=name
${element_form}                     id=lastname
${element_form}                     id=email 
${element_form}                     id=password 
