#!/usr/bin/python3.7
# -*- coding: utf-8 -*-
# @Time  : 2020/2/21 21:15
# @Author: Jtyoui@qq.com
from pyunit_tool import tool

value = tool.list_contain_string_subset(['a', 'b', 'c'], 'eat')
print(value)

value = tool.string_contain_list_subset(['eaten', 'apple', 'cat'], 'eat')
print(value)

value = tool.remove_subset(['a', 'b', 'ab'])
print(value)

value = tool.key_value_re(key=['a', 'b'], value=[0, 1], value_re='[01]')
print(value)

r = tool.reader_configure(r'C:\Users\Administrator\Desktop\单位简称.txt')
print(r)

b = tool.save_configure(r, r'C:\Users\Administrator\Desktop\单位简称1.txt')
print(b)

print(tool.get_file_md5(r'README.md'))
print(tool.binary_search([1, 2, 3, 4, 5, 7], 6))
