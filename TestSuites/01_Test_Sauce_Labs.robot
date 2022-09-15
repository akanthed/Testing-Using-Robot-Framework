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

Add And Remove Product In The Cart
    [Tags]  Product   Cart  SauceLabs
    [Setup]     Start Test Environment
    Page Should Contain Element    ${Product.Title.txt_title}
    Add Sauce Labs Backpack In The Cart
    Navigate To Cart Page
    Page Should Contain Element   ${Product.Cart.txt_item}
    Remove Sauce Labs Backpack From The Cart
    Page Should Not Contain Element    ${Product.Cart.txt_item}



