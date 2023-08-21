*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
${register_url}                     ${BASE_URL}/signup
${element_form}                     css=.signup-form 

# Forms add
${form_add_name}                    id=name
${form_add_name}                    id=lastname
${element_form}                     id=email 
${element_form}                     id=password 
