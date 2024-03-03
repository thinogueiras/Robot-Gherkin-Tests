*** Settings ***
Documentation           Suíte de testes de carrinho

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

Default Tags            carrinho

*** Test Cases ***
Deve incluir produto no carrinho a partir da página principal
    Dado que estou logado no Sauce Demo
    Quando adiciono o produto "Sauce Labs Bolt T-Shirt" ao carrinho
    Então vejo o produto dentro do carrinho

Deve incluir produto no carrinho a partir da página do produto
    Dado que estou logado no Sauce Demo
    E que estou na pagina do produto "Sauce Labs Bolt T-Shirt"
    Quando adiciono o produto ao carrinho
    Então vejo o produto dentro do carrinho

Deve remover produto do carrinho
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Quando removo o produto do carrinho
    Então vejo o carrinho vazio

Deve remover produto do carrinho a partir da página do produto
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Quando removo o produto a partir da página do produto
    Então vejo o carrinho vazio

Deve visualizar os detalhes do produto no carrinho
    Dado que estou logado no Sauce Demo
    Quando adiciono o produto "Sauce Labs Bolt T-Shirt" ao carrinho
    Então vejo nome, descrição, quantidade e o preço do produto no carrinho

Deve retornar para a página principal
    Dado que estou logado no Sauce Demo
    E tenho o produto "Sauce Labs Bolt T-Shirt" no carrinho
    Quando retorno para a página principal
    Então vejo a página principal