from setuptools import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules = [
    Extension('tool', ['tool.pyx'])
]

setup(
    name='sample app',
    cmdclass={'build_ext': build_ext},
    ext_modules=ext_modules
)
