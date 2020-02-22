#!/usr/bin/python3.7
# -*- coding: utf-8 -*-
# @Time  : 2020/2/21 21:15
# @Author: Jtyoui@qq.com
import re

cpdef list_contain_string_subset(ls, string):
    """列表中的某一个值是属于字符串的子集
    
    例子： ls=['a','b','c'],string='eat'
          那么ls中的a属于string中的子集

    :param string: 字符串
    :param ls: 字符串列表
    :return: 返回字符串的子集
    """
    v = []
    cdef int length = len(ls)
    for subset in range(length):
        if ls[subset] in string:
            v.append(ls[subset])
    return v

cpdef string_contain_list_subset(ls, string):
    """字符串属于列表中的某一个值
    
    例子： ls=['eaten','apple','cat'],string='eat'
          那么string中的eat是属于ls中的eaten一部分

    :param string: 字符串
    :param ls: 字符串列表
    :return: 返回list的子集
    """
    v = []
    cdef int length = len(ls)
    for subset in range(length):
        if string in ls[subset]:
            v.append(ls[subset])
    return v

cpdef remove_subset(ls):
    """去除列表中的子集

    比如：['aa','a','ab'] --> ['aa','ab']

    :param ls: 字符串列表
    :return: 返回去重后的结果
    """
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
    """根据value值的索引获取key或者根据key的索引获取到value

    :param key: k值。['a','b']
    :param value: v值。[0,1]
    :param value_re: 根据值的正则获取key。比如：01正则表达式获取到ab
    :param key_re: 同理。根据key的正则。获取到值。比如：ab正则表达式。返回01
    """
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
