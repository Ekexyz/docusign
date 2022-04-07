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
    VerifyText         Add Documents
    QVision.ClickText  tests  anchor=Desktop
    QVision.ClickText  suite  anchor=amble
    QVision.DoubleClick  files  anchor=resources
    QVision.DoubleClick  sample.pdf
    ClickCheckbox        I'm the only signer  on
    ClickText            sign
    ClickText            Please review the documents below.
    ClickText            Continue  anchor=Other Actions
    QVision.HoverText    Signature
    QVision.DragTo       Sample PDF  below=20
    VerifyText           Adopt Your Signature
    ClickText            Adopt and Sign  anchor=Cancel
    ClickText            Finish          anchor=Other Actions
    VerifyText           Sign and Return
    TypeText             Full Name       Erkka
    TypeText             Email Address   ${PROTON_USERNAME}
    TypeText             Message         Hello,\n\nSigned sample pdf.\n\nBr,\Name
    ClickText            Send and CLose  anchor=No Thanks

Verify Email
    [Documentation]    Log in to email and verify
    Appstate           Protonmail
    VerifyText         Welcome erkka
    VerifyText         Erkka Karimäki via Docusign  index=1
    ClickText          Erkka Karimäki via DocuSign  index=1
    VerifyText         Signed sample pdf.
    ClickText          ${PROTON_USERNAME}
    ClickText          Sign out
    VerifyText         Email or username

