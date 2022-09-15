*** Variables ***
${web_url}  https://www.saucedemo.com/
${username}     standard_user
${password}     secret_sauce


*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Library    BuiltIn

#Import Functional Keywords
Resource    ${CURDIR}/Keywords/Functional/Login.resource
Resource    ${CURDIR}/Keywords/Functional/Product.resource
Resource    ${CURDIR}/Keywords/Functional/Cart.resource
#Import Variables
Variables   ${CURDIR}/Locators/login.yaml
Variables   ${CURDIR}/Locators/products.yaml
