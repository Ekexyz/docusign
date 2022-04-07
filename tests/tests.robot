*** Settings ***
Resource        ../resources/common.robot
Suite Setup     Start suite
Suite Teardown  End suite

*** Test Cases ***
Sign a Document
    [Documentation]    Login to DocuSign and sign a pdf file
    Appstate           Home
