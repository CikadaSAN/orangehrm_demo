*** Settings ***
Library  SeleniumLibrary
Library  String
Variables    ../VARIABLES/test_xpath.py
Resource    ../VARIABLES/test_variables.robot

*** Keywords ***
Ensure user should be able to open Admin Menu
    element should be visible    ${menuAdminBtn}
    click element    ${menuAdminBtn}
    wait until element is visible    ${AddUserBtn}    20
    Log To Console    Open Admin Menu Success !!!


Ensure user should be able to open Add User Page
    element should be visible    ${AddUserBtn}
    click button    ${AddUserBtn}
    wait until element is visible    ${AddUserRoleDropdown}    10

Ensure user should be able to choose role
    element should be visible    ${AddUserRoleDropdown}
    click element    ${AddUserRoleDropdown}
    sleep    1s
    wait until element is visible    //span[contains(text(),'${inputRole}')]
    click element    //span[contains(text(),'${inputRole}')]
    sleep    1s

Ensure user should be able to choose status
    wait until element is visible    ${AddUserStatusDropdown}    10
    click element    ${AddUserStatusDropdown}
    sleep    1s
    wait until element is visible    //span[contains(text(),'${inputStatus}')]
    click element    //span[contains(text(),'${inputStatus}')]
    sleep    1s

Ensure user should be able to choose existing employee name
    wait until element is visible    ${AddUserEmployeeName}    10
    input text    ${AddUserEmployeeName}    a                               #<-- why i use "a" for searching employee name, because OrangeHRM dummy data are dynamic, so there is a chance for employee data will be changed
    sleep    3s                                                             #    expected flow is when user Type "A" on Employee Name, Robot-Framework can tap on the first results of the Employee Search
    wait until element is visible    ${AddUserEmployeeSelect}    10
    ${employeeName}=    get text    ${AddUserEmployeeSelect}
    set global variable    ${employeeName}
    click element    ${AddUserEmployeeSelect}
    sleep    1s

Ensure user should be able to input username
    wait until element is visible    ${AddUserUsernameInput}    10
    ${randomAbc}=    generate random string    4    [LETTERS]
    set global variable    ${randomAbc}
    input text    ${AddUserUsernameInput}   user${randomAbc}
    sleep    2s

Ensure user should be able to input password
    wait until element is visible    ${AddUserPasswordInput}    10
    input text    ${AddUserPasswordInput}    ${testPassword}

Ensure user should be able to input password confirmation
    wait until element is visible    ${AddUserPasswordConfirm}    10
    input text    ${AddUserPasswordConfirm}    ${testPassword}

Ensure user should be able to submit Add User
    wait until element is visible  ${AddUserSaveBtn}    10
    click element    ${AddUserSaveBtn}
    wait until element is visible    ${AddUserSuccessMsg}    20
    Log To Console    Add New Admin Success !!!!
    Log To Console    Username : user${randomAbc} | Password : ${testPassword} | Roles : ${inputRole} | Status : ${inputStatus} | Employee : ${employeeName}






