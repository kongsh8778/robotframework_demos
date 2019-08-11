*** Variables ***
&{d}              key=value    foo=bar

*** Test Cases ***
Example1
    # 方式一：key=value syntax
    &{dict} =    Create Dictionary    key=value    foo=bar
    Should Be True    ${dict} == {'key': 'value', 'foo': 'bar'}
    # 方式二：separate key and value
    &{dict2} =    Create Dictionary    key    value    foo    bar
    Should Be Equal    ${dict}    ${dict2}
    # 方式三：使用变量
    &{dict} =    Create Dictionary    ${1}=${2}    &{dict}    foo=new
    Should Be True    ${dict} == {1: 2, 'key': 'value', 'foo': 'new'}
    # 方式四：通过点访问字典的key
    Should Be Equal    ${dict.key}    value    # dot-access

Example2
    Log Many    &{d}
    &{dict} =    Create Dictionary    key=value    foo=bar
    Should Be Equal    ${dict}    ${d}
