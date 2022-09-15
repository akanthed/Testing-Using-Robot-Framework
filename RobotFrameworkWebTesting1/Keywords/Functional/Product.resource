*** Keywords ***
Add Sauce Labs Backpack In The Cart
    [Documentation]     Add Sauce Labs Backpack product in the cart
    ...     Steps To Be Performed
    ...     - Click on Sauce Labs Backpack Product
    ...
    ...     Pre-requistes:
    ...     - Product Page should display
    Click Button    ${Product.Bag.btn_add_to_cart}

Navigate To Cart Page
    [Documentation]     Go To Cart Page
    ...     Steps To Be Performed
    ...     - Click on Cart button
    ...
    ...     Pre-requistes:
    ...     - User Should Be Logged In
    Click Element   ${Product.Cart.btn_cart}