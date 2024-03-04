*** Settings ***
Documentation           Arquivo principal do projeto

Library                 Browser

Resource                pages/LoginPage.resource
Resource                pages/CartPage.resource

*** Variables ***
${BROWSER}              Chromium
${HEADLESS}             ${False}

*** Keywords ***
Start Test
    New Browser         browser=${BROWSER}        headless=${HEADLESS}

Finish Test
    Take Screenshot