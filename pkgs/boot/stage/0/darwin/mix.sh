{% extends '//mix/template/py.py' %}

{% block build %}
import os

os.chdir(os.environ['out'])
os.makedirs('bin')
os.chdir('bin')

F = (
    ('/usr/bin/lipo', 'lipo'),
    ('/usr/bin/ld', 'ld'),
    ('/usr/bin/install_name_tool', 'install_name_tool'),
    ('/usr/bin/libtool', 'libtool'),
    ('/bin/dash', 'dash'),
    ('/usr/bin/clang', 'clang'),
    ('/usr/bin/clang++', 'clang++'),
    ('/usr/bin/cpp', 'clang-cpp'),
    ('/usr/bin/ar', 'llvm-ar'),
    ('/usr/bin/ranlib', 'llvm-ranlib'),
    ('/usr/bin/nm', 'llvm-nm'),
    ('/usr/bin/strip', 'llvm-strip'),
)

for f, bn in F:
    os.symlink(f, bn)
{% endblock %}
