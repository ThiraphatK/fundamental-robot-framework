***Settings***
Resource     ${CURDIR}/../../imports/import.resource
Resource     ${CURDIR}/../../keywords/website_keywords.robot
Variables    ${CURDIR}/../../testdata/website_testdata.yaml
Test Template    Login to website

***Test Cases***
Login when username is correct    data=${saucedemo}    user_name=${saucedemo.username.input.standart}    password=${saucedemo.password.input}    browser=${chrome_brower}
Login when username is locked     data=${saucedemo}    user_name=${saucedemo.username.input.locked}    password=${saucedemo.password.input}    browser=${chrome_brower}
Login when username is problem    data=${saucedemo}    user_name=${saucedemo.username.input.problem}    password=${saucedemo.password.input}    browser=${chrome_brower}
Login when password is correct    data=${saucedemo}    user_name=${saucedemo.username.input.performance}    password=${saucedemo.password.input}    browser=${chrome_brower}