*** Settings ****
Resource            base_jira.robot
Library             SeleniumLibrary

Test Setup          Nova Sessão  
Test Teardown       Encerra Sessão 
***Variables****
${searchIssue}      CMCA-1784
*** Test Cases *** 
Login Com Sucesso
    [Tags]          login_sucesso
    Go To           ${url_jira}/Dashboard.jspa
    Login With      f67108a                     Pretoebranco@27
    Sleep           10
    Tikets Page     ${searchIssue}
    Initialization to FrontDesk
    Sleep           15
    FrontDesk to Analysis

    ${issue}        Get WebElement              id:key-val
    Should Contain  ${issue.text}               ${searchIssue}
    
*** Keywords ***
Login With
    [Arguments]     ${user}     ${pass}

    Input Text      id:login-form-username      ${user}
    Input Text      id:login-form-password      ${pass}
    Click Element   id:login

Tikets Page
    [Arguments]    ${searchIssue} 
    Go To          https://jind.magnetimarelli.com/fjira/browse/${searchIssue} 

Initialization to FrontDesk
    ${status}       Get WebElement                              id:status-val
    Run Keyword If  '${status.text}' == 'INITIALIZATION'        Click Element       id:action_id_481
    Sleep           10
    Input Text      id:customfield_14500                        jverdugo
    Click Element   id:issue-workflow-transition-submit

FrontDesk to Analysis
    ${status}       Get WebElement                              id:status-val
    Run Keyword If  '${status.text}' == 'FRONT DESK'            Click Element       id:assign-to-me
    Sleep            10
    Click Element    id:action_id_11
    Sleep            10
    Input Text       id:customfield_11704                        f67108a
    Click Element    id:issue-workflow-transition-submit

    