*** Test Cases ***
return list
    ${list}    create List    1    2    3
    Length Should Be    ${list}    3
    log many    @{list}

return scalar
    ${x}    evaluate    9
    log    ${x}

return dict
    &{d}    create dictionary    p=1    y=2    t=3    h=4    o=5
    ...    n=6
    length should be    ${d}    6
    log    ${d.t}

assign variables
    ${a}    ${b}    ${c}=    create List    1    2    3
    ${frist}    @{rest}=    create List    1    2    3
    @{frist}    ${rest}=    create List    1    2    3
    ${frist}    @{middle}    ${end}=    create List    1    2    3
