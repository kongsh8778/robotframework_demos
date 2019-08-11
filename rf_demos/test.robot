*** Settings ***
Library           RequestsLibrary

*** Variables ***
${a}              hello world
${c}              Set Variable    robot

*** Test Cases ***
Test
    # 从Json转换为字典类型
    ${j}    To Json    {"pass":"Authorized access"}
    log    ${j}
    # 从字典类型转换为Json
    ${d}    To Json    {"pass":"Authorized access"}    pretty_print=true
    log    ${d}

Test Local var
    log    ${a}
    Set Suite Variable    ${b}    hello
    log    ${c}

Test Global var
    log    ${b}
