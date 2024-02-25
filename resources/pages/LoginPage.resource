*** Settings ***
Documentation           Página de Login

Library                 Browser
Library                 String

Resource                ../helpers.resource

*** Variables ***
${BASE_URL}             https://www.saucedemo.com

*** Keywords ***
Go To Page
    New Page            ${BASE_URL}

Dado que estou no site Sauce Demo
    Go To Page

Fill Login Credentials
    [Arguments]         ${username}        ${password}

    Fill Text           css=#user-name     ${username}
    Fill Text           css=#password      ${password}

Click On Login Button
    Click               css=#login-button

Quando realizo login com o ${usuario} e ${senha}
    Fill Login Credentials            ${usuario}    ${senha}
    Click On Login button

Então sou redirecionado para a página principal
    Get Url             contains      inventory.html
    Check Page Secondary Header       Products
    Wait For Condition  Text          css=a[id="logout_sidebar_link"]   equals    Logout

Então o sistema exibe a mensagem: "${mensagem}"
    ${msg_error}        Get Text      css=h3[data-test="error"]

    ${new_msg_error}    Replace String    ${msg_error}    Epic sadface:${SPACE}    ${EMPTY}

    Should Be Equal As Strings        ${new_msg_error}    ${mensagem}