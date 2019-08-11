*** Test Cases ***
Example2
    # 定义一个suite级别字符串变量${SCALAR}
    Set Suite Variable    ${SCALAR}    Hello, world!
    # 重新给变量${SCALAR}赋值
    Set Suite Variable    ${SCALAR}    Hello, world!    children=true
    # 定义一个suite级别列表变量${LIST}
    Set Suite Variable    @{LIST}    First item    Second item
    # 定义一个suite级别字典变量${DICT}
    Set Suite Variable    &{DICT}    key=value    foo=bar
    # 将${DICT}值赋给${ID}
    ${ID} =    Get Variable Value    &{DICT}
    # 将${ID}设置为suite级别的变量
    Set Suite Variable    ${ID}

Example3
    # 直接使用Example2定义的uite级别的变量
    Log Many    &{DICT}

Example1
    ${hi} =    Set Variable    Hello, world!
    ${hi2} =    Set Variable    I said: ${hi}
    ${var1}    ${var2} =    Set Variable    Hello    world
    @{list} =    Set Variable    1    2    3    4
    ${item1}    ${item2} =    Set Variable    1    2
