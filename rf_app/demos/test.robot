*** Settings ***
Library           AppiumLibrary

*** Test Cases ***
打开应用
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0.1    deviceName=69T7N15A29003784    appPackage=com.xsteach.appedu    appActivity=com.xsteach.appedu.StartActivity
    ...    unicodeKeyboard=True    resetKeyboard=True

单击个人中心
    Sleep    5
    Click Element    id=content_rb_mine
    Page Should Contain Text    我的学习轨迹

输入内容
    Sleep    5
    Click Element    id=tv_search
    Input Text    id=editText    平面设计
