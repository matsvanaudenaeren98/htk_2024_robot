*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
#Globals
${WEBSITE URL}          http://hackthefuture.bignited.be/
${BROWSER}              Edge
${APPLICATION_TITLE}    Htf2024

#Page 1
${TITLE}                //h1
${TRANSMISSION_BUTTON}  id:action-button
${BODY}                 //body

#Page 2
${URL_PAGE_2}           https://hackthefuture.bignited.be/transition/07ecc934-9858-4d8f-a9c3-494fff648abf
${URL_PAGE_3}           https://hackthefuture.bignited.be/information

*** Test Cases ***
Open Test Website And Close Browser
    Open Test Website In Edge
    Click on go transmission
    Click on planet
    [Teardown]    Close Browser

Open Page 3 And Close Browser
    Open Page 3 In Edge
    [Teardown]    Close Browser


*** Keywords ***
Open Test Website In Edge
    Open Browser                       ${WEBSITE URL}    ${BROWSER}
    Wait Until Element Is Visible      ${TITLE}                             
    Title Should Be                    ${APPLICATION_TITLE}

Click on go transmission
    Wait Until Element Is Visible      ${TRANSMISSION_BUTTON}
    Click Button                       ${TRANSMISSION_BUTTON}
    Sleep                              15

Click on planet
    Click Element            ${BODY}
    Wait Until Location Is   ${URL_PAGE_2}

Open Page 3 In Edge
    Open Browser                       ${URL_PAGE_3}    ${BROWSER}
    Sleep                              2