# -*-coding:utf-8 -*-

from hashlib import md5


def md5_encrypt(text):
    """
    md5计算摘要
    :param text: 传入的是字符串类型
    :return: 返回hash值
    """
    m = md5()
    # TypeError: Unicode-objects must be encoded before hashing
    if isinstance(text, str):
        text = text.encode()
    m.update(text)
    return m.hexdigest()


if __name__ == "__main__":
    print(md5_encrypt('wcx123kongsh1'))
