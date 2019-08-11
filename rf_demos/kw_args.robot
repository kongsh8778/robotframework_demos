*** Test Cases ***
Varargs with user keywords
    Free Named Only
    Free Named Only    arg=1
    Free Named Only    arg1=1    arg2=2    arg3=3    arg4=4
    Positional And Free Named    required
    Positional And Free Named    arg1    arg2=2    arg3=3    arg4=4
    Run Program    required
    Run Program    required    optional
    Run Program    arg1=1    arg2=2    arg3=3    arg4=4

*** Keywords ***
Free Named Only
    [Arguments]    &{named}
    Log Many    &{named}

Positional And Free Named
    [Arguments]    ${required}    &{extra}
    Log Many    ${required}    &{extra}

Run Program
    [Arguments]    @{args}    &{config}
    Log Many    @{args}    &{config}