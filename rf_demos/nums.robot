*** Test Cases ***
num
    log    ${x}
    ${x}=    Set Variable    ${5}
    log    ${x}
    ${x}=    Set Variable    5    #${x}实际是个字符串
    log    ${x}
    ${x}=    Set Variable    ${5} #${x}实际是整型
    log    ${x}
    log    ${TEST NAME}
    log    ${TEST MESSAGE}

binary hex and oct nums
    Should Be Equal    ${0b1011}    ${11}
    Should Be Equal    ${0o10}    ${8}
    Should Be Equal    ${0xff}    ${255}
    Should Be Equal    ${0B1010}    ${0XA}
