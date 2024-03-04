*** Settings ***
Documentation           Suíte de testes de carrinho

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

Default Tags            carrinho

*** Test Cases ***
Deve incluir produto no carrinho a partir da página de produtos
    Dado que estou logado no Sauce Demo
    Quando adiciono o produto "Sauce Labs Bolt T-Shirt" ao carrinho
    Então vejo o produto "Sauce Labs Bolt T-Shirt" dentro do carrinho

Deve incluir produto no carrinho a partir da página do produto
    Dado que estou logado no Sauce Demo
    E que estou na página do produto "Sauce Labs Fleece Jacket"
    Quando adiciono o produto "Sauce Labs Fleece Jacket" ao carrinho
    Então vejo o produto "Sauce Labs Fleece Jacket" dentro do carrinho

Deve remover produto do carrinho a partir da página de produtos
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Bike Light" no carrinho
    Quando removo o produto do carrinho
    Então vejo o carrinho vazio

Deve remover produto do carrinho a partir da página do produto
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Backpack" no carrinho
    Quando removo o produto "Sauce Labs Backpack" a partir da página do produto
    Então vejo o carrinho vazio

Deve visualizar os detalhes do produto no carrinho
    Dado que estou logado no Sauce Demo
    Quando adiciono o produto "Sauce Labs Fleece Jacket" ao carrinho
    Então vejo os detalhes do produto "Sauce Labs Fleece Jacket" no carrinho

Deve retornar para a página de produtos a partir do carrinho
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Onesie" no carrinho
    Quando continuo para a Shopping
    Então vejo a página de produtos

Deve retornar para a página de produtos a partir da página de um produto
    Dado que estou logado no Sauce Demo
    E que estou na página do produto "Sauce Labs Onesie"
    Quando volto para os produtos
    Então vejo a página de produtos