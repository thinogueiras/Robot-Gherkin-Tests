*** Settings ***
Documentation           Arquivo principal do projeto

Library                 Browser

Resource                pages/login-page.resource

*** Variables ***
${BROWSER}              Chromium
${HEADLESS}             ${False}

*** Keywords ***
Start Test
    New Browser         browser=${BROWSER}        headless=${HEADLESS}

Finish Test
    Take Screenshot