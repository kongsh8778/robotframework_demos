*** Keywords ***
Launch
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0.1    deviceName=69T7N15A29003784    appPackage=com.xsteach.appedu    appActivity=com.xsteach.appedu.StartActivity
    ...    unicodeKeyboard=True    resetKeyboard=True

login
    [Arguments]    ${user_name}    ${pass_word}
    Sleep    10
    # 单击个人中心
    Click Element    id=content_rb_mine
    # 单击登录
    Click Element    id=tvLogin
    # 输入用户名
    Input Text    id=etUser    ${user_name}
    # 输入密码
    Input Text    id=etPwd    ${pass_word}
    #单击登录按钮
    Click Element    id=btnLogin
    Sleep    5
    # 断言
    Page Should Contain Text    ${user_name}
