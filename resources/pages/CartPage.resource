*** Settings ***
Documentation           Página do carrinho de compras

Library                 Browser

Resource                ../helpers.resource

*** Keywords ***
Enter Product Page
    [Arguments]         ${produto}=Sauce Labs Bolt T-Shirt

    Click               xpath=//div[contains(@class, "inventory_item_name")][text()="${produto}"]

    Check Page Secondary Header       Back to products

Check Quantity On Cart Badge
    [Arguments]         ${quantity}

    Get Text            css=.shopping_cart_badge    equals    ${quantity}

Go To Cart
    Click               css=.shopping_cart_link
    Get Url             contains      cart.html
    Check Page Secondary Header       Your Cart

Remove Product
    Click               css=button >> text=Remove

Dado que estou logado no Sauce Demo
    Login Successfully

E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Click               css=#add-to-cart-sauce-labs-bolt-t-shirt
    Check Quantity On Cart Badge      1
    Go To Cart

E que estou na pagina do produto "${produto}"
    Enter Product Page  ${produto}

Quando adiciono o produto "Sauce Labs Bolt T-Shirt" ao carrinho
    E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho

Quando adiciono o produto ao carrinho
    E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho

Quando removo o produto a partir da página do produto
    Enter Product Page
    Remove Product
    Go To Cart

Quando removo o produto do carrinho
    Remove Product

Quando retorno para a página principal
    Click               css=#continue-shopping

Então vejo o produto dentro do carrinho
    Wait For Condition  Text    css=.inventory_item_name    equals    Sauce Labs Bolt T-Shirt

Então vejo o carrinho vazio
    Wait For Elements State     css=.cart_item    detached

Então vejo nome, descrição, quantidade e o preço do produto no carrinho
    Então vejo o produto dentro do carrinho

    ${item_desc}        Set Variable        Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.

    Wait For Condition  Text    css=.inventory_item_desc    equals    ${item_desc}
    Wait For Condition  Text    css=.inventory_item_price   equals    $15.99
    Wait For Condition  Text    css=.cart_quantity          equals    1

Então vejo a página principal
    Check Page Secondary Header       Products