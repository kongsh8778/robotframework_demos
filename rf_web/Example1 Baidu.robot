*** Settings ***
Library           Selenium2Library
Resource          ObjectDeposit.txt

*** Test Cases ***
baidu
    Comment    用Chrome浏览器访问百度
    Open Browser    http://www.baidu.com    Chrome
    Comment    使用d定位到输入框，输入gloryroad
    Input Password    kw    gloryroad
    Comment    使用id定位到搜索框并单击
    Click Element    //*[@id='su']
    Comment    等待2描述
    sleep    2
    Comment    断言网页的标题变为gloryroad_百度搜索
    Title Should Be    gloryroad_百度搜索
    Comment    关闭浏览器
    Close Browser

test
    Log    ${sendmailsPage.sendBtn}
