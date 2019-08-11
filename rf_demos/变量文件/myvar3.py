#encoding=utf-8
def get_variables(env = "test"):
    if env == 'test':
        # test environment
        variables = {
            "phone": "1833",
            "default_host": "http://192.16.1.1:8086",
            "databaseurl": ["192.1.11", 3306, "root", "pa117!"],
            "UISdatabaseurl": ["192.16.14", 3306]
        }
    elif env == 'pro':
        # product environment
        variables = {
            "phone": "1591",
            "default_host": "http://pani.sv.com:886",
            "databaseurl": ["192.12.13", 8066, "root", "12456"],
            "UISdatabaseurl": ["192.1.6.14", 3306]
        }
    else:
        # back environment
        variables = {
            # urlConfig
            "mainurl": "http:",
            "phone": "1828833",
            "databaseurl": ["192.13", 8066, "root", "12456"],
            # dbConfig
            "db_trade": "",
            "db_trade_pw": ""
        }
    return variables
