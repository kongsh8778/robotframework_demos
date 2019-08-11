*** Settings ***
Library           Selenium2Library

*** Test Cases ***
log
    [Setup]    login
    log    hello
    {t}    Get Time    hello
    log    {t}

basic
    [Documentation]    Another dummy test
    [Tags]    dummy \ \ \ owner-johndoe
    log    hello world

set_tear
    [Setup]    login
    Open Browser     http://baidu.com    chrome
    Input Text     //*[@id='kw']     gloryroad
    Click Element     //*[@id='su'] \
    [Teardown]    exit

*** Keywords ***
login
    Open Browser    http://baidu.com    chrome
    log    login......

exit
    Close Browser
    exit    exit......
