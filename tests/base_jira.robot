***Settings****
Library     SeleniumLibrary

*** Variables ***
${url_jira}              https://jind.magnetimarelli.com/fjira/secure

*** Keywords ***
Nova Sessão
    Open Browser                    ${url_jira}             chrome


Encerra Sessão
    Capture Page Screenshot
    Close Browser
