#!/usr/bin/python3.7
# -*- coding: utf-8 -*-
# @Time  : 2020/2/23 1:22
# @Author: Jtyoui@qq.com
import shutil
import os

shutil.rmtree('build')
shutil.rmtree('dist')
shutil.rmtree('pyunit_tool.egg-info')
os.remove('pyunit_tool/tool.c')
