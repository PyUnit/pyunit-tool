#!/usr/bin/python3.7
# -*- coding: utf-8 -*-
# @Time  : 2020/2/21 21:51
# @Author: Jtyoui@qq.com


def list_contain_string_subset(ls: list, string: str) -> list:
    """列表中的某一个值是属于字符串的子集

    例子： ls=['a','b','c'],string='eat'
          那么ls中的a属于string中的子集

    :param string: 字符串
    :param ls: 字符串列表
    :return: 返回字符串的子集
    """
    pass


def string_contain_list_subset(ls: list, string: str) -> list:
    """字符串属于列表中的某一个值

    例子： ls=['eaten','apple','cat'],string='eat'
         那么string中的eat是属于ls中的eaten一部分

    :param string: 字符串
    :param ls: 字符串列表
    :return: 返回list的子集
    """
    pass


def remove_subset(ls: list) -> list:
    """去除列表中的子集

    比如：['aa','a','ab'] --> ['aa','ab']

    :param ls: 字符串列表
    :return: 返回去重后的结果
    """
    pass
