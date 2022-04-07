*** Settings ***
Library    QWeb

*** Variables ***
${BROWSER}          chrome
${LOGIN_URL}        https://www.docusign.com/
${USERNAME}         erkka.karimaki@qentinel.com

*** Keywords ***
Start suite
    [Documentation]    Initialization
    SetConfig          DefaultTimeout    20s
    SetConfig          LineBreak         ${EMPTY}
    Open Browser       ${LOGIN_URL}      ${BROWSER}

End suite
    [Documentation]    Teardown
    CloseAllBrowsers

Home
    [Documentation]    Navigate to DocuSign and sign in
 
