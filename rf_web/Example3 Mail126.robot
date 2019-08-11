*** Settings ***
Suite Teardown    Close Browser
Resource          ObjectDeposit.txt    # 定位表达式的配置文件
Resource          public.robot    # 封装好的公共关键字

*** Test Cases ***
test
    Login    testman1980    wulaoshi1978
    Add Contact Person    xiaoxiao    1234@qq.com    12345678909    学生
    Send Email    kongsh@hengbao.com    测试结果    F:\\PBKDF.txt    每天进步一点点
