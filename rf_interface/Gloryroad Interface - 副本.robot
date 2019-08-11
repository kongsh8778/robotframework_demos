*** Settings ***
Library           md5_encrypt.py
Library           RequestsLibrary
Library           Collections

*** Variables ***
${name}           ksh
${USERNAME}       ksh1111
${URL}            http://39.106.41.11:8080
${PASSWORD}       2514836ksh

*** Test Cases ***
register
    log    ************register
    # 调用python的random.randint方法生成1个随机数
    ${rand_num}    Evaluate    random.randint(1112,9999999999)    random
    #将${name}和随机数拼接作为用户名
    ${user_name}    Catenate    SEPARATOR=    ${name}    ${rand_num}
    ${payload}    Create Dictionary    username=${user_name}    password=${PASSWORD}    email=ksh@126.com
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为register
    Create Session    register    ${URL}
    # 发送post请求
    ${r}=    Post Request    register    /register/    data=${payload}    headers=${headers}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    00
    # 如果登录成功获取token
    ${USERNAME}    Set Variable If    ${code}==00    ${user_name}
    #将USERNAME设置为全局变量，后续接口使用
    Set Global Variable    ${USERNAME}

login
    log    ************login
    ${pw}    md5_encrypt    ${PASSWORD}
    ${payload}    Create Dictionary    username=${USERNAME}    password=${pw}
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    login    ${URL}
    ${r}=    Post Request    login    /login/    data=${payload}    headers=${headers}
    log    ${r.json()}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    00
    # 如果登录成功获取token和userid
    ${TOKEN}    Run Keyword If    ${code}==00    Get From Dictionary    ${r.json()}    token
    ${USER_ID}    Run Keyword If    ${code}==00    Get From Dictionary    ${r.json()}    userid
    #将TOKEN和USER_ID设置为全局变量，后续接口使用
    Set Global Variable    ${TOKEN}
    Set Global Variable    ${USER_ID}

create
    log    ************create
    ${payload}    Create Dictionary    userid=${USER_ID}    token=${TOKEN}    title=test py web    content=python port test2019
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为create
    Create Session    create    ${URL}
    # 发送post请求
    ${r}=    Post Request    create    /create/    data=${payload}    headers=${headers}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    00
    # 判断userid和输入的一致
    ${response_user_id}    Get From Dictionary    ${r.json()}    userid
    Should Be Equal    ${response_user_id}    ${USER_ID}

getBlogContent
    log    ************getBlogContent
    ${payload}    Create Dictionary    userid=${USER_ID}    token=${TOKEN}    title=test py web    content=python port test2019
    ${headers}    Create Dictionary    Content-Type=application/json
    # 连接服务器，会话的别名为create
    Create Session    getBlogContent    ${URL}
    # 发送get请求
    ${r}=    Get Request    getBlogContent    /getBlogContent/1
    log    ${r.json()}
    # 判断http协议响应码为200
    Should Be Equal As Strings    ${r.status_code}    200
    # 判断响应数据中code为00
    ${code}    Get From Dictionary    ${r.json()}    code
    Should Be Equal As Strings    ${code}    00
    # 判断userid和输入的一致
    #${article_id}    Get From Dictionary    ${r.json()}    articleId
    #Should Be Equal    ${response_user_id}    1
