*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${WEBSITE URL}          http://hackthefuture.bignited.be/
${BROWSER}              Edge
${APPLICATION_TITLE}    Htf2024

*** Test Cases ***
Open Test Website And Close Browser
    Open Test Website In Chrome
    [Teardown]    Close Browser

*** Keywords ***
Open Test Website In Chrome
    Open Browser          ${WEBSITE URL}    ${BROWSER}
    Sleep                 2
    Title Should Be       ${APPLICATION_TITLE}