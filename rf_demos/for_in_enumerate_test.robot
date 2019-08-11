*** Variables ***
@{LIST}         a    b    c

*** Test Cases ***
Manage index manually
    ${index} =    Set Variable    -1
    FOR    ${item}    IN    @{LIST}
        ${index} =    Evaluate    ${index} + 1
        Log Many      ${index}     ${item}
    END

For-in-enumerate
    FOR    ${index}    ${item}    IN ENUMERATE    @{LIST}
        Log Many       ${index}    ${item}
    END