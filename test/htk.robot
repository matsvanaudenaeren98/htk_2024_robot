*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${WEBSITE URL}      https://www.amazon.com/
${BROWSER}          Edge

*** Test Cases ***
Open Test Website And Close Browser
    Open Test Website In Chrome
    [Teardown]    Close Browser

*** Keywords ***
Open Test Website In Chrome
    Open Browser      ${WEBSITE URL}    ${BROWSER}
    Sleep             2
    Title Should Be   Amazon.com. Spend less. Smile more.