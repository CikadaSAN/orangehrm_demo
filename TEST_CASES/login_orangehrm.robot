*** Settings ***
Library  SeleniumLibrary
Variables    ../VARIABLES/test_xpath.py
Resource    ../VARIABLES/test_variables.robot

*** Keywords ***
Ensure user should be able to input login username
    wait until element is visible    ${loginInputUsername}    10
    input text    ${loginInputUsername}    ${testUsername}

Ensure user should be able to input login password
    wait until element is visible    ${loginInputPassword}    10
    input text    ${loginInputPassword}    ${testPassword}

Ensure user should be able to submit login
    element should be visible    ${loginSubmitBtn}
    click button    ${loginSubmitBtn}
    wait until element is visible    ${menuAdminBtn}    20
    Log To Console    Login Success !!!

Ensure user should not be able to login with invalid credentials
    wait until element is visible    ${loginInputUsername}    10
    input text    ${loginInputUsername}    ${invalidUser}

    wait until element is visible    ${loginInputPassword}    10
    input text    ${loginInputPassword}    ${invalidPass}

    element should be visible    ${loginSubmitBtn}
    click button    ${loginSubmitBtn}
    wait until element is visible    ${invalidLoginElement}    20
    ${errorTxt}=    get text    ${invalidLoginElement}
    should be equal    ${errorTxt}    ${invalidLoginWording}
    Log To Console    Login Failed, Error : ${errorTxt}
