*** Settings ***
Documentation           Suíte de testes de login

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

Default Tags            login

*** Variables ***
${USER_CORRETO}         standard_user
${USER_INCORRETO}       thiago_user
${SENHA_CORRETA}        secret_sauce
${SENHA_INCORRETA}      sauce_secret
${USER_VAZIO}           ${EMPTY}
${SENHA_VAZIA}          ${EMPTY}
${USER_BLOQUEADO}       locked_out_user

*** Test Cases ***
Deve logar com sucesso
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_CORRETO} e ${SENHA_CORRETA}
    Então sou redirecionado para a página principal

Deve validar usuário incorreto
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_INCORRETO} e ${SENHA_CORRETA}
    Então o sistema exibe a mensagem: "Username and password do not match any user in this service"

Deve validar senha incorreta
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_CORRETO} e ${SENHA_INCORRETA}
    Então o sistema exibe a mensagem: "Username and password do not match any user in this service"

Deve validar usuário obrigatório
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_VAZIO} e ${SENHA_CORRETA}
    Então o sistema exibe a mensagem: "Username is required"

Deve validar senha obrigatória
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_CORRETO} e ${SENHA_VAZIA}
    Então o sistema exibe a mensagem: "Password is required"

Deve validar usuário e senha não informados
    [Documentation]        Testa a tentativa de login clicando diretamente no botão "Login".

    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_VAZIO} e ${SENHA_VAZIA}
    Então o sistema exibe a mensagem: "Username is required"

Deve validar usuário bloqueado no sistema
    Dado que estou no site Sauce Demo
    Quando realizo login com o ${USER_BLOQUEADO} e ${SENHA_CORRETA}
    Então o sistema exibe a mensagem: "Sorry, this user has been locked out."