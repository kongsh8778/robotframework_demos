*** Settings ***
Library           AppiumLibrary
Resource          LocationExp.robot    # 定位表达式的配置文件
Resource          utils/keyword.robot    # 关键字资源文件

*** Test Cases ***
Example
    Launch
    login    fosterwu    gloryroad123
