*** Settings ***
Library    QWeb
Library    QVision

*** Variables ***
${BROWSER}          chrome
${LOGIN_URL}        https://www.docusign.com/

*** Keywords ***
Start suite
    [Documentation]    Initialization
    Set Library Search Order    QWeb
    SetConfig          DefaultTimeout    20s
    SetConfig          LineBreak         ${EMPTY}
    Open Browser       ${LOGIN_URL}      ${BROWSER}

End suite
    [Documentation]    Teardown
    CloseAllBrowsers

Home
    [Documentation]    Navigate to DocuSign and sign in
    # close cookies popup if exists
    ${cookies}=        IsText    Accept All Cookies
    Run Keyword If               ${cookies}
    ...  ClickText               Accept All Cookies
    VerifyText                   Log In
    ClickText                    Log In
    VerifyText                   Email
    TypeText                     Enter email    ${USERNAME}
    ClickText                    Next
    VerifyText                   Password
    TypeText                     Enter password  ${PASSWORD}
    ClickText                    Log In

Protonmail
    OpenWindow
    SwitchWindow       NEW
    GoTo               https://protonmail.com
    ClickText          Log In               anchor=Sign Up
    VerifyText         Email or username
    TypeText           Email or username    ${PROTON_USERNAME}
    TypeSecret         Password             ${PROTON_PASSWORD}
    ClickText          Sign In              anchor=New to Protonmail
