*** Variables ***
@{colors}         red    green    white
@{nums}           1    2
${index}          2

*** Test Cases ***
list
    log    ${colors}[0]
    log    @{colors}[-1]
    log    @{colors}[1:]
    log    @{colors}[${index}]
    log    @{nums}[0]
    # log    @{nums}[${index}] #越界
