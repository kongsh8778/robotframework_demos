*** Settings ***
Library           md5_encrypt.py
Library           RequestsLibrary
Library           Collections

*** Variables ***
${URL}            http://39.106.41.11:8080
${PASSWORD}       2514836ksh

*** Test Cases ***
Invalid Test For Register In Template
    [Template]     register
    # 用户名为空格
    ${SPACE}    02    ${False}
    # 用户已存在
    ksh1111    01    ${False}
	
Invalid Test For login In Template
	[Template]     login
    # 登录的用户不存在
    kongsh1    ${PASSWORD}    03
    # 登录的密码不正确
    ksh1111    2514836    03

*** Keywords ***
register
    [Arguments]    ${user_name}    ${exp_code}    ${is_paramter}
    [Documentation]    注册关键字
    [Tags]    my #标签为my
    log    ************register
    # 调用python的random.randint方法生成1个随机数
    ${rand_num}=    Evaluate    random.randint(1112,9999999999)    random
    #将${user_name}和随机数拼接作为用户名
    ${name}=    Catenate    SEPARATOR=    ${user_name}    ${rand_num}
    # 如果不需要参数化将${name}重新赋值给初始的${user_name}
    ${name}=    Set Variable If    '${is_paramter}'=='${False}'    ${user_name}
    Log    ${name}
    ${payload}    Create Dictionary    username=${name}    password=${PASSWORD}    email=ksh@126.com
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为register
    Create Session    register    ${URL}
    # 发送post请求
    ${r}=    Post Request    register    /register/    data=${payload}    headers=${headers}
    Log    ${r.json()}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    ${exp_code}
    # 如果登录成功获取token
    ${USERNAME}    Set Variable If    '${code}'=='00'    ${user_name}
    #将USERNAME设置为全局变量，后续接口使用
    Set Global Variable    ${USERNAME}

login
    [Arguments]    ${user_name}    ${password}    ${exp_code}
    [Documentation]    登录关键字
    [Tags]    my #标签为my
    log    ************login
    ${pw}    md5_encrypt    ${password}
    ${payload}    Create Dictionary    username=${user_name}    password=${pw}
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    login    ${URL}
    ${r}=    Post Request    login    /login/    data=${payload}    headers=${headers}
    log    ${r.json()}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    ${exp_code}
    # 如果登录成功获取token和userid
    ${TOKEN}    Run Keyword If    '${code}'=='00'    Get From Dictionary    ${r.json()}    token
    ${USER_ID}    Run Keyword If    '${code}'=='00'    Get From Dictionary    ${r.json()}    userid
    #将TOKEN和USER_ID设置为全局变量，后续接口使用
    Set Global Variable    ${TOKEN}
    Set Global Variable    ${USER_ID}

create
    [Arguments]    ${title}    ${content}    ${exp_code}
    [Documentation]    创建博文关键字
    [Tags]    my #标签为my
    log    ************create
    ${payload}    Create Dictionary    userid=${USER_ID}    token=${TOKEN}    title=${title}    content=${content}
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为create
    Create Session    create    ${URL}
    # 发送post请求
    ${r}=    Post Request    create    /create/    data=${payload}    headers=${headers}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    ${exp_code}
    # 判断userid和输入的一致
    ${response_user_id}    Get From Dictionary    ${r.json()}    userid
    Should Be Equal    ${response_user_id}    ${USER_ID}

getBlogContent
    [Arguments]    ${articieId}    ${exp_code}
    [Documentation]    查询博文内容关键字
    [Tags]    my #标签为my
    log    ************getBlogContent
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为create
    Create Session    getBlogContent    ${URL}
    # 发送get请求
    ${r}=    Get Request    getBlogContent    /getBlogContent/${articieId}
    log    ${r.json()}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    ${exp_code}
    # 通过Python中的正则，判断返回的userid和输入的一致
    ${response_user_id}    Evaluate    re.search(r"articleId': (\\d+)","${r.json()}").group(1)    re
    Should Be Equal    ${response_user_id}    ${articieId}
