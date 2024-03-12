*** Settings ***
Documentation           Funcionalidade: Carrinho de compras

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

Default Tags            carrinho

*** Test Cases ***
Cenário: Incluir produto no carrinho
    Dado que o usuário está logado no sistema
    Quando adicionar o produto "Sauce Labs Bolt T-Shirt" ao carrinho
    Então o produto é adicionado com sucesso ao carrinho

Cenário: Incluir produto no carrinho a partir da página do produto
    Dado que o usuário está logado no sistema
    E que está na página do produto "Sauce Labs Bolt T-Shirt"
    Quando adicionar o produto ao carrinho
    Então o produto é adicionado com sucesso ao carrinho

Cenário: Remover produto do carrinho
    Dado que o usuário está logado no sistema
    E que o produto "Sauce Labs Bike Light" está no carrinho
    Quando remover o produto do carrinho
    Então o carrinho fica vazio

Cenário: Remover produto do carrinho a partir da página do produto
    Dado que o usuário está logado no sistema
    E que o produto "Sauce Labs Backpack" está no carrinho
    Quando remover o produto a partir da página do produto
    Então o carrinho fica vazio

Cenário: Visualizar os detalhes do produto no carrinho
    Dado que o usuário está logado no sistema
    Quando adicionar o produto "Sauce Labs Fleece Jacket" ao carrinho
    Então os detalhes do produto serão exibidos no carrinho

Cenário: Retornar para a página de produtos a partir do carrinho
    Dado que o usuário está logado no sistema
    E que o produto "Sauce Labs Bike Light" está no carrinho
    Quando continuar para o Shopping
    Então a página de produtos é exibida com sucesso

Cenário: Retornar para a página de produtos a partir da página de um produto
    Dado que o usuário está logado no sistema
    E que está na página do produto "Sauce Labs Onesie"
    Quando voltar para a página de produtos
    Então a página de produtos é exibida com sucesso