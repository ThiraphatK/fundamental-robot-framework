***Settings***
Resource    ../imports/import.resource

***Keywords***
Login to website
    [Arguments]    ${data}    ${user_name}    ${password}    ${browser}
    Log    ${data}
    Log    ${user_name}
    Log    ${password}
    Log    ${browser}
    Open Browser    ${data.website}    ${browser}
    Input Text      id:${data.username.id}    ${user_name}
    Input Text      id:${data.password.id}    ${password}
    Click Button    id:${data.login_button.id}
    [Teardown]    Close Browser

Verify Login successed
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=30s

Verify Login failed
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=30s

Verify back to login page
    [Arguments]    ${locator}
    Wait Until Element Is Visible    class:${locator}    timeout=3s