*** Keywords ***
Start Test Environment
    [Documentation]     Login To Web Application
    ...     Steps To Be Performed:
    ...     - Open Browser with the given web url
    ...     - Maximize the Browser
    ...     - Enter Username
    ...     - Enter Password
    ...     - Click On Login Button
    [Arguments]     ${browser}=chrome
    Open Browser   ${web_url}   ${browser}  options=add_argument("--headless")
    Maximize Browser Window
    Input Text      ${Login.txt_username}    ${username}
    Input Text      ${Login.txt_password}    ${password}
    Click Element   ${Login.btn_login}