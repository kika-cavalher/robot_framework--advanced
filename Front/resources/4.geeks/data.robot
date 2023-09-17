*Settings*
Documentation                       Suite with elements HTML for geek test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${btn_be_geek}                     css=a[href="/be-geek"] >> text=Seja um Geek

#Check-in point
${element_geek_form}               css=.be-geek-form

# Forms add
${input_whats}                      id=whatsapp
${input_desc}                       id=desc
${input_printer_repair}             id=printer_repair
${input_work}                       id=work
${input_cost}                       id=cost
${btn_be_geek_submit}               css=button >> text=Quero ser um Geek      

# Validation
${msg_validation_register}          css=p >> text=Seu cadastro está na nossa lista de geeks. Agora é só ficar de olho no seu WhatsApp.

#TEXTS
#Attempt
${short_desc}                       Sou monossilábico.
${long_desc}                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
${empty_desc}                       
${empty_whats}                      
${empty_ddd}                        999999999
${empty_phone}                      11
${letter_cost}                      aaa
${alphaNumber_cost}                 a12
${specialCarac_cost}                10,50
${empty_cost}              