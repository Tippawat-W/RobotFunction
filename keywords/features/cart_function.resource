*** Keywords ***
Access To Address Page
    cart_page.Click Checkout Button
    address_page.Verify Access To Address Page Success

Verify Cart Page With Product On Cart
    [Arguments]    ${product_name}
    FOR    ${product_name}    IN  @{product_name.values()}
    cart_page.Verify Display Product To Cart Page Success    ${product_name}
    END

Access To Product Detail Page
    [Arguments]    ${product_name}
    cart_page.Click Product Name    ${product_name}
    product_detail_page.Verify Product Detail Success    ${product_name}

Back To Product List Page
    cart_page.Click Continue Button
    product_page.Verify Access To Product Page Success

Remove Product Out Of Cart
    [Arguments]    ${product_name}
    ${is_dict}    Evaluate    isinstance($product_name, dict)
    IF    ${is_dict}    
        FOR    ${product_name}    IN  @{product_name.values()}
        cart_page.Click Remove Button    ${product_name}
        cart_page.Verify Remove Product Success    ${product_name}
        END
    ELSE
        cart_page.Click Remove Button    ${product_name}
        cart_page.Verify Remove Product Success    ${product_name}
    END