#!/usr/bin/python3.7
# -*- coding: utf-8 -*-
# @Time  : 2020/2/21 21:15
# @Author: Jtyoui@qq.com
from pyunit_tool import *

value = list_contain_string_subset(['a', 'b', 'c'], 'eat')
print(value)

value = string_contain_list_subset(['eaten', 'apple', 'cat'], 'eat')
print(value)

value = remove_subset(['a', 'b', 'ab'])
print(value)

value = key_value_re(key=['a', 'b'], value=[0, 1], value_re='[01]')
print(value)
