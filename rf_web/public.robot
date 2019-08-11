*** Settings ***
Library           Selenium2Library
Resource          ObjectDeposit.txt    # 定位表达式的配置文件

*** Keywords ***
Login
    [Arguments]    ${user name}    ${password}
    Log    //************Login
    Comment    打开Chrome浏览器，访问http://mail.126.com
    Open Browser    http://mail.126.com    chrome
    Comment    等待5秒
    sleep    5
    Comment    浏览器窗口最大化
    Maximize Browser Window
    Comment    切换到登录rame
    Select Frame    ${loginPage.frame}
    Comment    定位输入框并输入用户名
    Input Text    ${loginPage.userName}    ${user name}
    Comment    定位密码输入框并输入密码
    Input password    ${loginPage.passWord}    ${password}
    Comment    单击登录按钮
    click element    ${loginPage.loginBtn}
    Comment    等待2秒
    sleep    2
    Comment    断言页面源码中包含关键字"退出"
    page should contain    退出

Add Contact Person
    [Arguments]    ${contacter}    ${email}    ${phone}    ${comment}
    Log    //************Add Contact Person
    Comment    单击通讯录标签
    click element    ${homePage.addressBook}
    Sleep    1
    Comment    单击新建联系人标签
    click element    ${addcontactsPage.createContactsBtn}
    Comment    输入联系人姓名
    Input Text    ${addcontactsPage.contactPersonName}    ${contacter}
    Comment    输入联系人邮箱
    Input Text    ${addcontactsPage.contactPersonEmail}    ${email}
    Comment    设为星标联系人
    click element    ${addcontactsPage.starContacts}
    Comment    输入手机号码
    Input Text    ${addcontactsPage.contactPersonMobile}    ${phone}
    Comment    输入备注信息
    Input Text    ${addcontactsPage.contactPersonComment}    ${comment}
    Comment    单击确定按钮
    click element    ${addcontactsPage.saveContacePerson}
    Sleep    1
    Comment    断言页面源码中包含关键字"退出"
    page should contain    退出

Send Email
    [Arguments]    ${reciver}    ${subject}    ${filepath}    ${content}
    Log    //************Send Email
    Comment    等待1秒
    Sleep    1
    Comment    回到首页
    click element    ${homePage.homePage}
    Comment    单击写信按钮
    Wait Until Element Is Visible    ${sendmailsPage.writeEmailBtn}
    click element    ${sendmailsPage.writeEmailBtn}
    Comment    输入联系人邮箱
    Input Text    ${sendmailsPage.recivePerson}    ${reciver}
    Comment    输入主题
    Input Text    ${sendmailsPage.subject}    ${subject}
    Sleep    5
    Comment    上传文件
    #choose file    //div[contains(@title, "600首MP3")]/input    ${filepath}
    #Wait Until Element Is Visible    ${sendmailsPage.addAttachmentBtn}
    choose file    ${sendmailsPage.addAttachmentBtn}    ${filepath}
    Comment    显示等待直到出现"上传完成"
    Wait Until Element Is Visible    ${sendmailsPage.asserContent}
    Comment    切换到邮件正文rame
    Select Frame    ${sendmailsPage.mailBodyFrame}
    Comment    输入邮件正文内容
    Input Text    ${sendmailsPage.mailBody}    ${content}
    Comment    切换到默认的rame
    Unselect Frame
    Comment    单击发送按钮
    click element    ${sendmailsPage.sendBtn}
    Comment    等待3秒
    Sleep    3
    Comment    断言页面源码中包含"发送成功"
    ${html}    Get Source
    Should Contain    ${html}    发送成功
