*** Variables ***
${result}         3.14

*** Test Cases ***
Example
    # 用字符串'3.14'比较，返回False
    ${status} =    Evaluate    0 < ${result} < 10
    # 转换为数字类型的3.14
    ${exp}=    Evaluate    float(${result} )
    Should Be Equal    ${exp}    ${3.14}
    ${random} =    Evaluate    random.randint(0, sys.maxsize)    modules=random, sys
    # 生成一个字典    {'x': 4, 'y': 2}
    ${ns} =    Create Dictionary    x=${4}    y=${2}
    # 将字典作为命名空间，用字典中的数据进行运算
    ${result} =    Evaluate    x*10 + y    namespace=${ns}
