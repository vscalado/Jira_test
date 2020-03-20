***Settings****
Library     SeleniumLibrary

*** Variables ***
${issue}    

***Keywords****
Search Issue
    [Arguments]     ${sIssue}
    Input Text      id:quickSearchInput     ${sIssue}