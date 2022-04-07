*** Settings ***
Library    QWeb
Library    QVision

*** Variables ***
${BROWSER}          chrome
${LOGIN_URL}        https://www.docusign.com/
${USERNAME}         erkka.karimaki@qentinel.com

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
    ${cookies}=        IsText    Accept All Cookies
    Run Keyword And Return If    ${cookies}
    ...  ClickText               Accept All Cookies
    VerifyText                   Log In
    ClickText                    Log In
    VerifyText                   Email
    TypeText                     Enter email    ${USERNAME}
    ClickText                    Next
    VerifyText                   Password
    TypeText                     Enter password  Qentinel2022!
    ClickText                    Log In


