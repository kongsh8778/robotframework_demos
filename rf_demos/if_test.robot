*** Test Cases ***
If Test Int
    # 判断数字类型
    ${var}    Set Variable    ${3}
    Run Keyword If    ${var}<0    Log    -1
    ...    ELSE IF    ${var}==0    Log    0
    ...    ELSE IF    1<=${var}<=10    Log    1
    ...    ELSE    Log    2

If Test Str
    # 判断字符串类型
    ${var}    Set Variable    aaa
    Run Keyword If    '${var}'=='aaa'    Log    equal
    ...    ELSE    Log    different

If Test 2 Condtions
    # 2个判断条件
    # 默认都是字符串类型
    @{list}    Create List    1    2    3
    Log    ${2} in @{list}
    Run Keyword If    ${2}in@{list} and ${3}in@{list}    Log    1111
    ...    ELSE    Log    2222
