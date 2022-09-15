*** Settings ***
Resource    ${CURDIR}/../ImportResources.resource
Suite Teardown    Close Browser

*** Variables ***
${title}    Swag Labs

*** Test Cases ***
Login To Web Application And Check Title
    [Tags]  Login   SauceLabs
    Start Test Environment
    Title Should Be     ${title}

Add And Verify Product In The Cart
    [Tags]  Product  SauceLabs
    [Setup]     Start Test Environment
    Page Should Contains Element    ${Product.Title.txt_title}

