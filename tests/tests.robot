*** Settings ***
Resource        ../resources/common.robot
Suite Setup     Start suite
Suite Teardown  End suite

*** Test Cases ***
Sign a Document
    [Documentation]        Login to DocuSign and sign a pdf file.
    Appstate               Home
    VerifyText             Start Now
    ClickText              Start Now
    VerifyText             Drop your files here or
    ClickText              Upload
    VerifyText             Desktop
    ClickText              Desktop
    VerifyText             Add Documents
    QVision.ClickText      other Locations
    QVision.ClickText      Computer
    # check if headless run, different folder structure
    ${headless}=           QVision.IsText         execution
    IF  ${headless}
      QVision.ClickText      execution
      QVision.DoubleClick    docusign  anchor=Name
      QVision.DoubleClick    files     anchor=resources
    ELSE
      QVision.ClickText      tests  anchor=Desktop
      QVision.ClickText      suite  anchor=amble
      QVision.DoubleClick    files  anchor=resources
    END
    QVision.DoubleClick    sample.pdf
    ClickCheckbox          I'm the only signer  on
    ClickText              sign
    ClickText              Please review the documents below.
    ClickText              Continue  anchor=Other Actions
    VerifyText             Signature   anchor=Initial
    QVision.HoverText      Signature   pause=1s  anchor=Initial
    QVision.DragTo         Sample PDF  below=20
    ${adopt}=              IsText          Adopt Your Signature
    Run Keyword If         ${adopt}
    ...                    ClickText              Adopt and Sign  anchor=Cancel
    ClickText              Finish          anchor=Other Actions
    VerifyText             Sign and Return
    TypeText               Full Name       Erkka
    TypeText               Email Address   ${PROTON_USERNAME}
    TypeText               Message         Hello,\n\nSigned sample pdf.\n\nBr,\n Me
    ClickText              Send and Close  anchor=No Thanks
    ${question}=           IsText          You're Done! Want To Sign Another Document?
    Run Keyword If         ${question}
    ...                    ClickText       No Thanks    

Verify Email
    [Documentation]    Log in to email and verify
    Appstate           Protonmail
    VerifyText         Welcome Erkka
    VerifyText         Erkka Karimäki via DocuSign  index=1
    ClickText          Erkka Karimäki via DocuSign  index=1
    VerifyText         Signed sample pdf.
    VerifyText         VIEW DOCUMENT
    ClickText          VIEW DOCUMENT
    VerifyText         Link confirmation
    ClickText          Confirm                      anchor=Cancel
    SwitchWindow       NEW
    QVision.VerifyText                              Sample PDF
    ClickText          Close
    VerifyText         You're All Done!
    CloseWindow
    # logout from proton
    ClickText          ${PROTON_USERNAME}
    ClickText          Sign out
    VerifyText         Email or username
    CloseWindow

