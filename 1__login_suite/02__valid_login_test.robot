*** Settings ***

Documentation
Resource    ../resource/base/common_functionality.resource/

Library     DataDriver  file*../test_data/orange_data.xlsx      sheet_name=InvalidLoginTest
Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

Test Template    Valid Login Template

*** Test Cases ***
TC1     Admin    admin123     Dashboard
TC2     adminq   admin123     Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]   ${username}     ${password}     ${expected_error}
    Input Text    name=username     ${username}
    Input Text    name=password     ${password}
    Click Element    xpath=//button[(normalize-space()='Login')]
    Element Should Contain    xpath=//h6[contains((normalize-space(),'Dash')]   ${expected_error}