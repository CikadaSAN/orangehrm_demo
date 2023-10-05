*** Settings ***
Library  SeleniumLibrary
Resource    ../TEST_CASES/add_user_orangehrm.robot
Resource    ../TEST_CASES/login_orangehrm.robot
Resource    ../TEST_CASES/open_browser.robot

Variables    ../VARIABLES/test_xpath.py
Resource    ../VARIABLES/test_variables.robot
*** Test Cases ***
#Login Part Test Cases
Open OrangeHRM Web
    Open OrangeHRM Dashboard

Login OrangeHRM Cases
    Ensure user should not be able to login with invalid credentials
    sleep    2s
    Ensure user should be able to input login username
    Ensure user should be able to input login password
    Ensure user should be able to submit login

Add New OrangHRM User Cases
    Ensure user should be able to open Admin Menu
    Ensure user should be able to open Add User Page
    Ensure user should be able to choose role
    Ensure user should be able to choose status
    Ensure user should be able to choose existing employee name
    Ensure user should be able to input username
    Ensure user should be able to input password
    Ensure user should be able to input password confirmation
    Ensure user should be able to submit Add User





