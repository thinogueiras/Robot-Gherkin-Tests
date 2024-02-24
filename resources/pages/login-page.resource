*** Settings ***
Documentation           Página de Login

Library                 Browser

*** Variables ***
${BASE_URL}             https://www.saucedemo.com

*** Keywords ***
Go To Page
    New Page            ${BASE_URL}

Dado que estou no site Sauce Demo
    Go To Page

Quando logar com o ${usuario} e ${senha}
    Fill Text           css=#user-name        ${usuario}
    Fill Text           css=#password         ${senha}

    Click               css=#login-button

Então sou redirecionado para a página principal
    Wait For Condition  Text        css=a[id="logout_sidebar_link"]   equals    Logout
    Get Url             contains    inventory.html

Então o sistema exibe a mensagem: "${mensagem}"
    Wait For Condition  Text        css=h3[data-test="error"]   contains    ${mensagem}