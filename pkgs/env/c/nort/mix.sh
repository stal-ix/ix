{% extends '//mix/template/py.py' %}

{% block lib_deps %}
dev/lang/clang/mix.sh
{% endblock %}

{% block build %}
import os
import sys

os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')

files = (
    ('clang', 'gcc'),
    ('clang++', 'g++'),
    ('clang-cpp', 'cpp'),
    ('llvm-ar', 'ar'),
    ('llvm-ranlib', 'ranlib'),
    ('llvm-strip', 'strip'),
    ('llvm-nm', 'nm')
)

for x, y in files:
    os.symlink(mix.which(x), y)
{% endblock %}
