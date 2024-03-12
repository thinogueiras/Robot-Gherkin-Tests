*** Settings ***
Documentation           Funcionalidade: Login

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

Default Tags            login

*** Test Cases ***
Cenário: Login com sucesso
    Dado que o usuário está na página de login
    Quando realizar login com credenciais válidas
    Então é redirecionado para a página principal

Cenário: Validar usuário incorreto
    Dado que o usuário está na página de login
    Quando realizar login com um usuário incorreto
    Então o sistema exibe a mensagem: "Username and password do not match any user in this service"

Cenário: Validar senha incorreta
    Dado que o usuário está na página de login
    Quando realizar login com uma senha incorreta
    Então o sistema exibe a mensagem: "Username and password do not match any user in this service"

Cenário: Validar usuário obrigatório
    Dado que o usuário está na página de login
    Quando realizar login sem informar um usuário
    Então o sistema exibe a mensagem: "Username is required"

Cenário: Validar senha obrigatória
    Dado que o usuário está na página de login
    Quando realizar login sem informar uma senha
    Então o sistema exibe a mensagem: "Password is required"

Cenário: Validar usuário e senha obrigatórios
    Dado que o usuário está na página de login
    Quando realizar login sem informar as credenciais
    Então o sistema exibe a mensagem: "Username is required"

Cenário: Validar usuário bloqueado no sistema
    Dado que o usuário está na página de login
    Quando realizar login com um usuário bloqueado
    Então o sistema exibe a mensagem: "Sorry, this user has been locked out."