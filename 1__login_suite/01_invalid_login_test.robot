*** Settings ***

Documentation
Resource    ../resource/base/common_functionality.resource/

Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=InvalidLoginTest
Test Template    Invalid Login Template

*** Test Cases ***
TC1

*** Keywords ***
Invalid Login Template

    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username     ${username}
    Input Text    name=password     ${password}
    Click Element   xpath=//button[(normalize-space()='Login')]
    Element Should Contain    xpath=//p[contains(@class,'oxd-alert')]    ${expected_error}