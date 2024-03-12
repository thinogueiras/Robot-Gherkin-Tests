*** Settings ***
Documentation           Helpers

Library                 Browser

Resource                pages/LoginPage.resource

*** Keywords ***
Check Page Secondary Header
    [Arguments]         ${header_text}

    Get Text            css=.header_secondary_container    contains    ${header_text}

Login Successfully
    Go To Page
    Fill Login Credentials        standard_user    secret_sauce
    Click On Login Button
    Click                         css=#react-burger-menu-btn
    Wait For Condition            Text      css=#logout_sidebar_link    equals    Logout