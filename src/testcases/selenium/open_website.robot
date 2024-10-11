***Settings***
Resource     ${CURDIR}/../../imports/import.resource
Resource     ${CURDIR}/../../keywords/website_keywords.robot
Variables    ${CURDIR}/../../testdata/website_testdata.yaml

***Test Cases***
Login when username is correct
    [Documentation]    Login to website with correct username
    Login to website    data=${saucedemo}    user_name=${saucedemo.username.input.standart}    password=${saucedemo.password.input}    browser=${chrome_brower}
    Verify Login successed    //div[contains(text(), "Product")]
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button
    Click Button    //*[@id="menu_button_container"]/div/div[3]/div/button
    Sleep   3s
    Click Element   id:logout_sidebar_link
    Verify back to login page    login_logo
    [Teardown]    Close Browser