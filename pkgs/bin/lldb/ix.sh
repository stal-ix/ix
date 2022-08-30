{% extends '//lib/llvm/14/ix.sh' %}

{% block bld_libs %}
lib/xz
lib/xml/2
lib/edit
lib/python
lib/curses
{% if linux %}
lib/linux
{% endif %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/swig/4
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|libkind SHARED|libkind STATIC|' -i lldb/cmake/modules/AddLLDB.cmake
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="clang;lldb"
LLDB_ENABLE_LIBEDIT=ON
LLDB_ENABLE_CURSES=ON
LLDB_ENABLE_LZMA=ON
LLDB_ENABLE_LIBXML2=ON
LLDB_ENABLE_PYTHON=ON
{% endblock %}
