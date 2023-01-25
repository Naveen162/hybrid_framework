*** Settings ***

Documentation
...     records
Resource    ../resource/base/common_functionality.resource/

Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Library     DataDriver      file=../test_data/orange_data.xlsx       sheet=_addEmployeetest
Test Template       Add Valid Employee Template
*** Test Cases ***
Add Valid Employee Test_${test_name}

*** Keywords ***
Add Valid Employee Template

    [Arguments]       ${username}      ${password}     ${firstname}    ${lastname}     ${middlename}    ${expected_fullname}    ${expected_firstname}
    Input Text        name:username    ${username}
    Input Password    name:password    ${password}
    Click Element     xpath=//button[(normalize-space()='Login')]
    Click Element     xpath=//span[contains(normalize-space(),'PIM')]
    Click Element     link=Add Employee
    Input Text        name=firstName    ${firstname}
    Input Text        name=middleName   ${middlename}
    Input Text        name=lastName     ${lastname}
    Sleep   5s
    Click Element     xpath=//button[(normalize-space()='Save')]
    #Wait Until Page Contains Element    ${firstname}${SPACE}${lastname}
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstname}')]        ${expected_fullname}
    Element Attribute Value Should Be    name=firstName    value    ${expected_firstname}