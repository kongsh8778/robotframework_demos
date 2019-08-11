*** Settings ***
Library           RequestsLibrary

*** Test Cases ***
Test
    # 从Json转换为字典类型
    ${j}    To Json    {"pass":"Authorized access"}
    log    ${j}
    # 从字典类型转换为Json
    ${d}    To Json    {"pass":"Authorized access"}    pretty_print=true
    log    ${d}
