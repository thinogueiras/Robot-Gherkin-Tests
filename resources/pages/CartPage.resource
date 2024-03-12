*** Settings ***
Documentation           Página do carrinho de compras

Library                 Browser

Resource                ../helpers.resource

*** Keywords ***
Enter Product Page
    [Arguments]         ${produto}

    Click               xpath=//div[contains(@class, "inventory_item_name")][text()="${produto}"]

    Wait For Condition  Text    css=.inventory_details_name    equals    ${produto}

Check Quantity On Cart Badge
    [Arguments]         ${quantity}

    Get Text            css=.shopping_cart_badge    equals    ${quantity}

Go To Cart
    Click               css=.shopping_cart_link
    Get Url             contains      cart.html
    Check Page Secondary Header       Your Cart

Remove Product
    Click               css=button >> text=Remove

Check Product Details In Cart
    [Arguments]             ${produto}      ${descricao}    ${price}    ${quantity}=1

    ${xpath_pai}            Set Variable    //*[@class="inventory_item_name"][text()="${produto}"]

    ${product_name}         Get Text        xpath=${xpath_pai}

    ${product_desc}         Get Text        xpath=${xpath_pai}/../../*[@class="inventory_item_desc"]

    ${product_price}        Get Text        xpath=${xpath_pai}/../../*[@class="item_pricebar"]/div

    ${product_quantity}     Get Text        xpath=${xpath_pai}/../../../*[@class="cart_quantity"]

    Should Be Equal         ${product_name}        ${produto}

    Run Keyword And Continue On Failure        Should Be Equal         ${product_desc}        ${descricao}
    Run Keyword And Continue On Failure        Should Be Equal         ${product_price}       ${price}
    Run Keyword And Continue On Failure        Should Be Equal         ${product_quantity}    ${quantity}

Dado que o usuário está logado no sistema
    Login Successfully

E que o produto "${produto}" está no carrinho
    ${product}          Convert To Lower Case        ${produto}
    ${product}          Replace String        ${product}        ${SPACE}        -

    Click               css=#add-to-cart-${product}
    Check Quantity On Cart Badge      1
    Go To Cart

E que o produto está no carrinho
    ${product}          Convert To Lower Case        Sauce Labs Bolt T-Shirt
    ${product}          Replace String        ${product}        ${SPACE}        -

    Click               css=#add-to-cart-${product}
    Check Quantity On Cart Badge      1
    Go To Cart

E que está na página do produto "${produto}"
    Enter Product Page  ${produto}

Quando adicionar o produto "${produto}" ao carrinho
    E que o produto "${produto}" está no carrinho

Quando adicionar o produto ao carrinho
    E que o produto está no carrinho

Quando remover o produto a partir da página do produto
    Enter Product Page  Sauce Labs Backpack
    Remove Product
    Go To Cart

Quando remover o produto do carrinho
    Remove Product

Quando continuar para o Shopping
    Click               css=#continue-shopping

Quando voltar para a página de produtos
    Click               css=#back-to-products

Então o produto é adicionado com sucesso ao carrinho
    Wait For Condition  Text    css=.inventory_item_name    equals    Sauce Labs Bolt T-Shirt

Então o carrinho fica vazio
    Wait For Elements State     css=.cart_item    detached

Então os detalhes do produto serão exibidos no carrinho
    ${item_desc}        Set Variable          It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.

    Check Product Details In Cart       Sauce Labs Fleece Jacket    descricao=${item_desc}    price=$49.99    quantity=1

Então a página de produtos é exibida com sucesso
    Check Page Secondary Header     Products
    Wait For Elements State         css=.inventory_list    visible