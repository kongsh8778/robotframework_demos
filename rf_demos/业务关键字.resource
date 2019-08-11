*** Settings ***
Library           Selenium2Library

*** Keywords ***
百度搜索
    [Arguments]    ${content}
    Open Browser    http://www.baidu.com/    chrome
    Title Should Be    百度一下，你就知道
    Input Text    //*[@id='kw']    ${content}
    Click Element    //*[@id='su']
    Close Browser
