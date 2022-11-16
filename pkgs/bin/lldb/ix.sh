{% extends '//lib/llvm/latest/ix.sh' %}

{% block bld_libs %}
lib/xz
lib/xml/2
lib/edit
lib/python
lib/curses
lib/kernel
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
sed -e 's|.*define __STDC_LIMIT_MACROS.*||' -i lldb/bindings/interfaces.swig
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="clang;lldb"
LLDB_ENABLE_LIBEDIT=ON
LLDB_ENABLE_CURSES=ON
LLDB_ENABLE_LZMA=ON
LLDB_ENABLE_LIBXML2=ON
LLDB_ENABLE_PYTHON=OFF
{% endblock %}

{% block ninja_build_targets %}
lldb
lldb-argdumper
lldb-instr
lldb-server
lldb-vscode
{% endblock %}

{% block ninja_install_targets %}
install-lldb
install-lldb-argdumper
install-lldb-instr
install-lldb-server
install-lldb-vscode
{% endblock %}
