***Settings***
Resource    ../imports/import.resource

***Keywords***
Login to website
    [Arguments]    ${data}    ${user_name}    ${password}    ${browser}
    Open Browser    ${data.website}    ${browser}
    Maximize Browser Window
    Input Text      id:${data.username.id}    ${user_name}
    Input Text      id:${data.password.id}    ${password}
    Click Button    id:${data.login_button.id}

To verify list products page
    [Arguments]    ${page}    ${products_data}
    # verify xpath in page
    Wait Until Element Is Visible    ${page.product_header.xpath}    timeout=30s
    Wait Until Element Is Visible    ${page.shopping_cart.xpath}     timeout=30s
    Wait Until Element Is Visible    ${page.products.xpath}          timeout=30s
    # verify text in page
    ${product_header_text}=    Get Text    ${page.product_header.xpath}
    Should Be Equal As Strings    ${page.product_header.text}    ${product_header_text}
    # verify products in page
    ${products_name}=    Get WebElements    class=inventory_item_name
    ${products_price}=    Get WebElements    class=inventory_item_price
    ${products_length}=    Get Length    ${products_name}
    FOR    ${index}    IN RANGE   ${products_length}
        ${name}=    Get Text    ${products_name}[${index}]
        ${price}=    Get Text    ${products_price}[${index}]
        Should Be Equal As Strings    ${products_data[${index}].name}     ${name}
        Should Be Equal As Strings    ${products_data[${index}].price}    ${price}
    END

Add product to cart
    [Arguments]    ${button}
    Click Button    ${button}

Verify product in cart
    [Arguments]    ${product_page}    ${your_cart_page}    ${products_data}
    Click Element    ${product_page.shopping_cart.xpath}
    Wait Until Element Is Visible    ${your_cart_page.qty_header.xpath}    timeout=30s
    Wait Until Element Is Visible   ${your_cart_page.desc_header.xpath}    timeout=30s
    # verify product in cart
    ${name}=    Get Text    ${your_cart_page.product_name.xpath}
    Should Be Equal As Strings    ${products_data[0].name}    ${name}

Check out product
    [Arguments]    ${checkout_button_locator}
    Click Element    ${checkout_button_locator}

Verify and fill in personal information
    [Arguments]    ${info_page}
    # verify header
    Wait Until Element Is Visible    ${info_page.header.xpath}    timeout=30s
    ${header_text}=    Get Text    ${info_page.header.xpath}
    Should Be Equal As Strings    ${info_page.header.text}    ${header_text}
    # fill in personal information
    Input Text       ${info_page.first_name.id}    ${info_page.first_name.input}
    Input Text       ${info_page.last_name.id}     ${info_page.last_name.input}
    Input Text       ${info_page.zip_code.id}      ${info_page.zip_code.input}
    Click Element    ${info_page.continue_button.xpath}

Verify overview page
    [Arguments]    ${overview_page}    ${products_data}
    # verify topic in page
    Wait Until Element Is Visible    ${overview_page.header.xpath}    timeout=30s
    Wait Until Element Is Visible    ${overview_page.qty_header.xpath}    timeout=30s
    Wait Until Element Is Visible    ${overview_page.desc_header.xpath}    timeout=30s
    Wait Until Element Is Visible    class:${overview_page.payment_info.cls}    timeout=30s
    Wait Until Element Is Visible    class:${overview_page.shipping_info.cls}    timeout=30s
    Wait Until Element Is Visible    class:${overview_page.item_total.cls}    timeout=30s
    Wait Until Element Is Visible    class:${overview_page.tax.cls}    timeout=30s
    Wait Until Element Is Visible    class:${overview_page.total.cls}    timeout=30s
    # verify header
    ${header_text}=    Get Text    ${overview_page.header.xpath}
    Should Be Equal As Strings    ${overview_page.header.text}    ${header_text}
    # verify product in cart
    ${name}=    Get Text    ${overview_page.product_name.xpath}
    ${price}=    Get Text    ${overview_page.product_price.xpath}
    Should Be Equal As Strings    ${products_data[0].name}    ${name}
    Should Be Equal As Strings    ${products_data[0].price}    ${price}

Click finish button
    [Arguments]    ${finish_button_locator}
    Click Element    ${finish_button_locator}

Verify order complete page
    [Arguments]    ${complete_page}
    Wait Until Element Is Visible    ${complete_page.header.xpath}    timeout=30s
    Wait Until Element Is Visible    ${complete_page.name.xpath}    timeout=30s
    Wait Until Element Is Visible    ${complete_page.message.xpath}    timeout=30s
    Wait Until Element Is Visible    ${complete_page.image.xpath}    timeout=30s
    ${name}=    Get Text    ${complete_page.name.xpath}
    ${message}=    Get Text    ${complete_page.message.xpath}
    Should Be Equal As Strings    ${complete_page.name.text}    ${name}
    Should Be Equal As Strings    ${complete_page.message.text}    ${message}