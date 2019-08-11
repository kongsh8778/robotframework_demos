*** Settings ***
Library           DateTime

*** Test Cases ***
Example
    ${time1}    Get Current Date
    # 1970年1月1号到现在的秒数
    ${time2}    Get Current Date    result_format=epoch
    ${time3}    Get Current Date    result_format=timestamp
    ${time4}    Get Current Date    result_format=%d.%m.%Y %H:%M
    ${time5}    Get Current Date    result_format=datetime
    log    ${time5.year}

Subtract Date
    ${date1}    Get Current Date
    ${date2}    Get Current Date
    ${sub1}    Subtract Date From Date    ${date2}    ${date1}
    ${sub2}    Subtract Time From Date    ${date2}    01:00:00
