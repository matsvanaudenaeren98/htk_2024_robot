*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
#Globals
${WEBSITE URL}          http://hackthefuture.bignited.be/
${BROWSER}              Edge
${APPLICATION_TITLE}    Htf2024
${BODY}                 //body

#Page 1
${TITLE}                //h1
${TRANSMISSION_BUTTON}  id:action-button

#Page 2
${URL_PAGE_2}           https://hackthefuture.bignited.be/transition/07ecc934-9858-4d8f-a9c3-494fff648abf

#Page 3
${URL_PAGE_3}           https://hackthefuture.bignited.be/information
${NAME_PAGE_3}          id:name
${AGE_PAGE_3}           id:age
${SPECIES_PAGE_3}       id:species
${PLANET_PAGE_3}        id:planet
${INPUT_NAME_PAGE_3}    Shamaan
${INPUT_AGE_PAGE_3}     99
${INPUT_SPECIES_PAGE_3}    xenomorph
${INPUT_PLANET_PAGE_3}    Promethius

#Page 4
${SKIP_BUTTON_PAGE_4}   class:ski-button

#Page 5
${IMG_PAGE_5}              css:img
${CODE_PAPER}              class:murder

*** Test Cases ***
Open Test Website And Close Browser
    Open Test Website In Edge
    Click on go transmission
    Click on planet
    [Teardown]    Close Browser

Open Page 3 And Close Browser
    Open Page 3 In Edge
    Check if inputs are visible
    Fill in inputs
    Click skip
    Click on code paper
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

Check if inputs are visible
    Wait Until Element Is Visible      ${NAME_PAGE_3}
    Wait Until Element Is Visible      ${AGE_PAGE_3}
    Wait Until Element Is Visible      ${SPECIES_PAGE_3}
    Wait Until Element Is Visible      ${PLANET_PAGE_3}

Fill in inputs
    Input Text    ${NAME_PAGE_3}    ${INPUT_NAME_PAGE_3}
    Input Text    ${AGE_PAGE_3}     ${INPUT_AGE_PAGE_3}
    Select From List By Value    ${SPECIES_PAGE_3}    ${INPUT_SPECIES_PAGE_3}
    Input Text    ${PLANET_PAGE_3}    ${INPUT_PLANET_PAGE_3}
    Press Keys    None    RETURN

Click skip
    Wait Until Element Is Visible  ${SKIP_BUTTON_PAGE_4}        15
    Click Button                   ${SKIP_BUTTON_PAGE_4}

Click on code paper
    Click Element At Coordinates    ${IMG_PAGE_5}    24    78
    Wait Until Element Is Visible   ${CODE_PAPER}
    Sleep    10

