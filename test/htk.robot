*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${WEBSITE URL}          http://hackthefuture.bignited.be/
${BROWSER}              Edge
${APPLICATION_TITLE}    Htf2024
${TRANSMISSION_BUTTON}  id:action-button

*** Test Cases ***
Open Test Website And Close Browser
    Open Test Website In Edge
    Click on go transmission
    [Teardown]    Close Browser

*** Keywords ***
Open Test Website In Edge
    Open Browser                       ${WEBSITE URL}    ${BROWSER}
    Sleep                              2
    Title Should Be                    ${APPLICATION_TITLE}

Click on go transmission
    Wait Until Element Is Visible      ${TRANSMISSION_BUTTON}
    Click Button                       ${TRANSMISSION_BUTTON}
    Sleep                              15