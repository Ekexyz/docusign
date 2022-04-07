*** Settings ***
Resource        ../resources/common.robot
Suite Setup     Start suite
Suite Teardown  End suite

*** Test Cases ***
Sign a Document
    [Documentation]    Login to DocuSign and sign a pdf file
    Appstate           Home
    VerifyText         Start Now
    ClickText          Start Now
    VerifyText         Drop your files here or
    ClickText          Upload
    VerifyText         Desktop
    ClickText          Desktop
