#!/usr/bin/python3.7
# cython: language_level=3
# -*- coding: utf-8 -*-
# @Time  : 2020/2/21 21:15
# @Author: Jtyoui@qq.com
import re
import hashlib

cpdef list_contain_string_subset(ls, string):
    """列表中的某一个值是属于字符串的子集"""
    v = []
    cdef int length = len(ls)
    for subset in range(length):
        if ls[subset] in string:
            v.append(ls[subset])
    return v

cpdef string_contain_list_subset(ls, string):
    """字符串属于列表中的某一个值"""
    v = []
    cdef int length = len(ls)
    for subset in range(length):
        if string in ls[subset]:
            v.append(ls[subset])
    return v

cpdef remove_subset(ls):
    """去除列表中的子集"""
    ls = list(set(ls))
    cdef int length = len(ls)
    total = []
    for i in range(length):
        for j in range(length):
            if (i != j) and (ls[i] in ls[j]):
                break
        else:
            total.append(ls[i])
    return total

cpdef key_value_re(key, value, value_re=None, key_re=None):
    """根据value值的索引获取key或者根据key的索引获取到value"""
    cdef int length = len(key)
    ls = []
    if len(key) == len(value):
        for index in range(length):
            k = key[index]
            v = value[index]
            if value_re:
                match = re.match(value_re, str(v))
                if match:
                    ls.append(k)
            elif key_re:
                match = re.match(key_re, str(k))
                if match:
                    ls.append(v)
    else:
        raise ValueError('key和value的长度要一样长')
    return ls

cpdef reader_configure(path, encoding = 'UTF-8'):
    """读取配置文件"""
    cx = {}
    with open(path, encoding=encoding)as fp:
        for data in fp:
            data = data.strip()
            if data.startswith('[') and data.endswith(']'):
                key = data[1:-1]
                cx.setdefault(key, [])
            elif (not data.startswith('#')) and data:
                cx[key].append(data)
            else:
                pass
    return cx

cpdef save_configure(cx, path, encoding='UTF-8'):
    """保存配置文件"""
    with open(path, 'w', encoding=encoding)as fp:
        for key, value in cx.items():
            fp.write(f'[{key}]\n')
            for v in value:
                fp.write(v.strip() + '\n')
            fp.write('\n')
    return True

cpdef get_file_md5(file_path):
    """获取文件的MD5值"""
    hash_ = hashlib.md5()
    with open(file_path, 'rb')as f:
        while True:
            b = f.read(8096)
            if not b:
                break
            else:
                hash_.update(b)
    data = hash_.hexdigest()
    if data and isinstance(data, str):
        return data.upper()
    return ''

cpdef binary_search(ls, key, lows=None, highs=None):
    """二分搜索算法"""
    cdef int length = len(ls)
    cdef int low = lows or 0
    cdef int high = highs or (len(ls) - 1)
    cdef int mid = 0
    while 0 <= low <= high < length:
        mid = (low + high) // 2
        if ls[mid] == key:
            return mid
        elif ls[mid] > key:
            high = mid - 1
        else:
            low = mid + 1
    return -1
