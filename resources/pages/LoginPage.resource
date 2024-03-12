*** Settings ***
Documentation           Página de Login

Library                 Browser
Library                 String

Resource                ../helpers.resource

*** Variables ***
${BASE_URL}             https://www.saucedemo.com
${USER_CORRETO}         standard_user
${USER_INCORRETO}       thiago_user
${SENHA_CORRETA}        secret_sauce
${SENHA_INCORRETA}      sauce_secret
${USER_VAZIO}           ${EMPTY}
${SENHA_VAZIA}          ${EMPTY}
${USER_BLOQUEADO}       locked_out_user

*** Keywords ***
Go To Page
    New Page            ${BASE_URL}
    Wait For Condition  Text        css=.login_logo    equals    Swag Labs

Dado que o usuário está na página de login
    Go To Page

Fill Login Credentials
    [Arguments]         ${username}        ${password}

    Fill Text           css=#user-name     ${username}
    Fill Text           css=#password      ${password}

Click On Login Button
    Click               css=#login-button

Quando realizar login com credenciais válidas
    Fill Login Credentials            ${USER_CORRETO}    ${SENHA_CORRETA}
    Click On Login button

Quando realizar login com um usuário incorreto
    Fill Login Credentials            ${USER_INCORRETO}  ${SENHA_CORRETA}
    Click On Login button

Quando realizar login com uma senha incorreta
    Fill Login Credentials            ${USER_CORRETO}    ${SENHA_INCORRETA}
    Click On Login button

Quando realizar login sem informar um usuário
    Fill Login Credentials            ${USER_VAZIO}      ${SENHA_CORRETA}
    Click On Login button

Quando realizar login sem informar uma senha
    Fill Login Credentials            ${USER_CORRETO}    ${SENHA_VAZIA}
    Click On Login button

Quando realizar login sem informar as credenciais
    Fill Login Credentials            ${USER_VAZIO}      ${SENHA_VAZIA}
    Click On Login button

Quando realizar login com um usuário bloqueado
    Fill Login Credentials            ${USER_BLOQUEADO}  ${SENHA_CORRETA}
    Click On Login button

Então é redirecionado para a página principal
    Get Url             contains      inventory.html
    Check Page Secondary Header       Products
    Wait For Condition  Text          css=a[id="logout_sidebar_link"]   equals    Logout

Então o sistema exibe a mensagem: "${mensagem}"
    ${msg_error}        Get Text      css=h3[data-test="error"]

    ${new_msg_error}    Replace String    ${msg_error}    Epic sadface:${SPACE}    ${EMPTY}

    Should Be Equal As Strings        ${new_msg_error}    ${mensagem}