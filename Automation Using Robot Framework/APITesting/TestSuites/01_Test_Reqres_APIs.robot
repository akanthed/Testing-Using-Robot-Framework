*** Settings ***
Resource    ${CURDIR}/../ImportResources.resource
Suite Setup     Create Session      APITest    ${url}   verify=true
Suite Teardown  Delete All Sessions

*** Variables ***
${url}      https://reqres.in
${users}    /api/users
${list_users}   ${users}?page
${single_user}  ${users}/2
${invalid_single_user}  ${users}/23
${login}     /api/login

*** Test Cases ***
API - Get List Of Users
    [Tags]  API
    ${resp}=    Get On Session      APITest     ${list_users}      expected_status=200
    Dictionary Should Contain Key    ${resp.json()}  data
    Should Be Equal As Strings     ${resp.json()}[data][0][first_name]      George

API - Get Single User
    [Tags]  API
    ${resp}=    Get On Session      APITest     ${single_user}      expected_status=200
    Dictionary Should Contain Key    ${resp.json()}  data
    Log     ${resp.json()}
    Should Be Equal As Strings     ${resp.json()}[data][first_name]      Janet

API - Get Single User Not Found
    [Tags]  API
    ${resp}=    Get On Session      APITest     ${invalid_single_user}      expected_status=404

API - Post New Single User
    [Tags]  API
    &{data}=    Create Dictionary   name=Akshay     job=Automation Tester
    ${resp}=    Post On Session      APITest     ${users}   json=${data}      expected_status=201
    Should Be Equal As Strings     ${resp.json()}[name]      Akshay

API - Patch Single User
    [Tags]  API     
    &{data}=    Create Dictionary   name=Akshay     job=Automation Tester
    ${resp}=    Patch On Session      APITest     ${single_user}   json=${data}      expected_status=200
    Should Be Equal As Strings     ${resp.json()}[name]      Akshay

API - Post Login Successful
    [Tags]  API
    &{data}=    Create Dictionary   email=eve.holt@reqres.in     password=pistol
    ${resp}=    Post On Session      APITest     ${login}   json=${data}      expected_status=200
    Log To Console      ${resp.json()}[token]

API - Post Login Unsuccessful
    [Tags]  API 
    &{data}=    Create Dictionary   email=peter@klaven
    ${resp}=    Post On Session      APITest     ${login}   json=${data}      expected_status=400
    Should Be Equal As Strings     ${resp.json()}[error]    Missing password

