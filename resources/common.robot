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
    Run Keyword And Return If    ${cookies}
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
    ClickText          Log In  anchor=Sign Up
    TypeText           Email or username    ${PROTON_USERNAME}
    TypeSecret         Password             ${PROTON_PASSWORD}
    ClickText          Sign In              anchor=New to Protonmail
    VerifyText         Welcome erkka
    VerifyText         Erkka Karimäki via Docusign  index=1
    ClickText          Erkka Karimäki via DocuSign  index=1
    VerifyText         Signed sample pdf.
    ClickText          ${PROTON_USERNAME}
    ClickText          Sign out
    VerifyText         Email or username