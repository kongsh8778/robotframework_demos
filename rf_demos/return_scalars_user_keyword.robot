*** Test Cases ***
One Return Value
    ${ret} =    Return One Value    1
    log    ${ret}

Multiple Values
    ${a}    ${b}    ${c} =    Return Three Values
    @{list} =    Return Three Values
    ${scalar}    @{rest} =    Return Three Values

*** Keywords ***
Return One Value
    [Arguments]    ${arg}
    ${value} =    evaluate    ${arg} + 1
    [Return]    ${value}

Return Three Values
    [Return]    foo    bar    zap
