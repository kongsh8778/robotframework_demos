*** Test Cases ***
One Return Value
    ${ret} =    Return One Value    1
    log    ${ret}

Advanced
    @{list} =    Create List    foo    baz    #创建一个列表
    ${index} =    Find Index    baz    @{list}    #找到baz在列表中的索引
    Should Be Equal    ${index}    ${1}    #断言索引为1
    ${index} =    Find Index    non existing    @{list}    #查找不存在的元素
    Should Be Equal    ${index}    ${-1}    #断言找不到元素时返回-1

*** Keywords ***
Return One Value
    [Arguments]    ${arg}
    ${value} =    evaluate    ${arg} + 1    #参数+1后赋值给${value}
    Return From Keyword    ${value}    # 将${value}返回
    Fail    This is not executed

Find Index
    [Arguments]    ${element}    @{items}
    ${index} =    Set Variable    ${0}
    : FOR    ${item}    IN    @{items}
    \    Return From Keyword If    '${item}' == '${element}'    ${index}
    \    ${index} =    Set Variable    ${index + 1}

${EMPTY}
    Return From Keyword    ${-1}    # Could also use [Return]
