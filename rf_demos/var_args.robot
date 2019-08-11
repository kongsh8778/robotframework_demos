*** Test Cases ***
Varargs with user keywords
    Any Number Of Arguments
    Any Number Of Arguments    arg
    Any Number Of Arguments    arg1    arg2    arg3    arg4
    One Or More Arguments    required
    One Or More Arguments    arg1    arg2    arg3    arg4
    Required, Default, Varargs    required
    Required, Default, Varargs    required    optional
    Required, Default, Varargs    opt=2    req=hello
    Required, Default, Varargs    arg1    arg2    arg3    arg4    arg5

*** Keywords ***
Any Number Of Arguments
    [Arguments]    @{varargs}
    Log Many    @{varargs}

One Or More Arguments
    [Arguments]    ${required}    @{rest}
    Log Many    ${required}    @{rest}

Required, Default, Varargs
    [Arguments]    ${req}    ${opt}=42    @{others}
    Log    Required: ${req}
    Log    Optional: ${opt}
    Log    Others:
    : FOR    ${item}    IN    @{others}#for 循环
    \    Log    ${item}
