*** Settings ***
Library           Selenium2Library
Resource          ObjectDeposit.txt    # 定位表达式的配置文件

*** Keywords ***
Login
    [Arguments]    ${user name}    ${password}
    Comment    打开Chrome浏览器，访问http://mail.126.com
    Open Browser    http://mail.126.com    chrome
    Comment    等待5秒
    sleep    5
    Comment    浏览器窗口最大化
    Maximize Browser Window
    Comment    切换到登录rame
    Select Frame    //*[contains(@id,"x-URS-iframe")]
    Comment    定位输入框并输入用户名
    Input Text    //input[@name="email" and @tabindex="1"]    ${user name}
    Comment    定位密码输入框并输入密码
    Input password    //*[@name='password']    ${password}
    Comment    单击登录按钮
    click element    //*[@id='dologin']
    Comment    等待2秒
    sleep    2
    Comment    断言页面源码中包含关键字"退出"
    page should contain    退出

Add Contact Person
    [Arguments]    ${contacter}    ${email}    ${phone}    ${comment}
    Comment    单击通讯录标签
    click element    //div[text()="通讯录"]
    Sleep    1
    Comment    单击新建联系人标签
    click element    //span[.='新建联系人']
    Comment    输入联系人姓名
    Input Text    //a[@title="编辑详细姓名"]/preceding-sibling::div/input    ${contacter}
    Comment    输入联系人邮箱
    Input Text    //*[@id="iaddress_MAIL_wrap"]//input    ${email}
    Comment    设为星标联系人
    click element    //span[text()="设为星标联系人"]/preceding-sibling::span/b
    Comment    输入手机号码
    Input Text    //div[.="手机号码"]/following::input[1]    ${phone}
    Comment    输入备注信息
    Input Text    //textarea    ${comment}
    Comment    单击确定按钮
    click element    //span[.="确 定"]
    Sleep    1
    Comment    断言页面源码中包含关键字"退出"
    page should contain    退出

Send Email
    [Arguments]    ${reciver}    ${subject}    ${filepath}    ${content}
    Comment    等待1秒
    Sleep    1
    Comment    单击首页标签
    click element    //div[text()="首页"]
    Comment    单击写信按钮
    click element    //span[.="写 信"]
    Comment    输入联系人邮箱
    Input Text    //div[@title="发给多人时地址请以分号隔开"]//input    ${reciver}
    Comment    输入主题
    Input Text    //div[@aria-label="邮件主题输入框，请输入邮件主题"]/input    ${subject}
    Comment    上传文件
    choose file    //div[contains(@title, "600首MP3")]/input    ${filepath}
    Comment    显示等待直到出现"上传完成"
    Wait Until Element Is Visible    //span[text()="上传完成"]
    Comment    切换到邮件正文rame
    Select Frame    //iframe[@class="APP-editor-iframe"]
    Comment    输入邮件正文内容
    Input Text    //html/body    ${content}
    Comment    切换到默认的rame
    Unselect Frame
    Comment    单击发送按钮
    click element    //div[@class="nui-toolbar-item"]//span[.="发送"]
    Comment    等待3秒
    Sleep    3
    Comment    断言页面源码中包含"发送成功"
    ${html}    Get Source
    Should Contain    ${html}    发送成功
