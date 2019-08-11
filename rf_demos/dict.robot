*** Variables ***
&{user 1}         name=kongsh    password=1234    42=0
&{user 2}         name=kongsh    password=1234    password=kongsh
&{user 3}         name=kongsh\=88
${key}            name

*** Test Cases ***
dict
    log many    ${user 1}[${key}]    ${user 1}[42]
    log    ${user 2}[password]
    log    &{user 3}[name]
    log    ${user 3.name}
