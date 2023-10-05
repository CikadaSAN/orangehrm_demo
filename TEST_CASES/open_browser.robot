*** Settings ***
Library  SeleniumLibrary
Variables    ../VARIABLES/test_xpath.py
Resource    ../VARIABLES/test_variables.robot

*** Keywords ***
Open OrangeHRM Dashboard
    Open browser    ${orangeUrl}    Chrome
    set window size    ${1700}    ${900}
    Wait until element is visible    ${loginInputUsername}    60
    Log To Console    Open OrangeHRM Success !!!