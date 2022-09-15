*** Keywords ***
Remove Sauce Labs Backpack From The Cart
    [Documentation]     Remove Sauce Labs Backpack product from the cart
    ...     Steps To Be Performed
    ...     - Click on Remove button
    ...
    ...     Pre-requistes:
    ...     - Cart Page should display
    ...     - Item Should be available in Cart
    Click Button    ${Product.Cart.btn_remove}