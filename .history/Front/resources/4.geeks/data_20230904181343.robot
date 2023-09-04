*Settings*
Documentation                       Suite with elements HTML for register test

Resource                            ../0.default/Base.robot

*** Variables ***
# Default
${btn_be_geek}                     css=a[href="/be-geek"]

#Check-in point


# Forms add


# Validation
${msg_validation_register}          css=p >> text=Agora você faz parte da Getgeeks. Tenha uma ótima experiência.
${msg_span_error}                   css=span[class=error]
${msg_error_title}                  id=swal2-title
${msg_error_content}                id=swal2-html-container
${msg_validation_register}          css=p >> text=Agor
