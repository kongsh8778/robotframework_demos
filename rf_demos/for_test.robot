*** Test Cases ***
Example For New
    FOR    ${animal}    IN    cat    dog
        Log    ${animal}      console=true
        Log    2nd keyword    console=true
	END
    Log    Outside loop        console=true
	
Example For Old
    :FOR    ${animal}    IN    cat    dog
    \    Log    ${animal}      console=true
    \   Log    2nd keyword    console=true
    Log    Outside loop        console=true	
	
Example For Three Loop Variables
    FOR    ${index}    ${english}    ${finnish}    IN
    ...     1           cat           kissa
    ...     2           dog           koira
    ...     3           horse         hevonen
        Log Many    ${english}    ${finnish}    ${index}    console=true
    END

Example Continue For Loop If
    @{list}    Create List    1    2    3
    : FOR    ${i}    IN    @{list}
    \    Continue For Loop If    '${i}'=='2'
    \    Log    ${i}
