*** Settings ***
Resource                                    ../resources//0.default/Base.robot
Documentation                               Delorean

*** Tasks ***
Back To The Past

    Connect To Postgress
    Reset Env
    Users Seed
    Disconnect from Database