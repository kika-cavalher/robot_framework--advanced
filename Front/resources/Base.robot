*Settings*

Documentation                               Base Test

Library                                     Browser
Library                                     factories/Users.py
Resource                                    Actions.robot

*Variables*
${BASE_URL}                                 https://getgeeks-erica.herokuapp.com

*Keywords*

Start Session
    New Browser                             chromium                        headless=False                          slowMo=00:00:00.5
    New Page                                ${BASE_URL}

Finish Session
    Take Screenshot