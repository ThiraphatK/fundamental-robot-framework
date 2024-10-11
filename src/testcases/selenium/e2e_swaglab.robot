***Settings***
Resource     ${CURDIR}/../../imports/import.resource
Resource     ${CURDIR}/../../keywords/swaglab_keywords.robot
Variables    ${CURDIR}/../../testdata/swaglab_testdata.yaml

***Test Cases***
Verify order a product online successfully
    [Documentation]    To verify that the user can order a product online successfully
    Login to website    data=${saucedemo}    user_name=${saucedemo.username.input.standart}    password=${saucedemo.password.input}    browser=${chrome_brower}
    To verify list products page    ${list_products_page}    ${products_data}
    Add product to cart    ${list_products_page.add_to_cart_button.xpath}
    Verify product in cart    ${list_products_page}    ${your_cart_page}    ${products_data}
    Check out product    ${your_cart_page.checkout_button.xpath}
    Verify and fill in personal information    ${info_page}
    Verify overview page    ${overview_page}    ${products_data}
    Click finish button  ${overview_page.finish_button.xpath}
    Verify order complete page    ${complete_page}
    [Teardown]    Close Browser

