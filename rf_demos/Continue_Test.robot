*** Test Cases ***
Example
    @{list}    Create List    1    2    3
    : FOR    ${i}    IN    @{list}
    \    Continue For Loop If    '${i}'=='2'
    \    log    ${i}
