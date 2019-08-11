*** Test Cases ***
Example
    # 创建好的列表赋值给列表变量
    @{list}    Create List    a    b    c
    # 创建好的列表赋值给标量
    ${scalar}    Create List    a    b    c
    Log Many    @{list}
    Log    ${scalar}
    # 创建数字类型的列表
    ${ints}    Create List    ${1}    ${2}    ${3}
    Log Many    ${ints}
