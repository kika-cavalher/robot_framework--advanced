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

