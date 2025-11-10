{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
neovim
{% endblock %}

{% block version %}
0.11.5
{% endblock %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c63450dfb42bb0115cd5e959f81c77989e1c8fd020d5e3f1e6d897154ce8b771
{% endblock %}

{% block bld_libs %}
lib/uv
lib/lua
lib/uv/l
lib/intl
lib/vterm
lib/utf8/proc
lib/unibilium
lib/msgpack/c
lib/tree/sitter
lib/shim/fake(lib_name=lpeg)
{% endblock %}

{% block bld_tool %}
bld/make
bin/gperf
bld/gettext
{% endblock %}

{% block cmake_flags %}
USE_BUNDLED=OFF
{% endblock %}

{% block setup_tools %}
{{super()}}

L=$(which lua)

cat << EOF > luajit
#!$(which sh)
export LUA_PATH="${LUA_PATH}:\${LUA_PATH}"
exec "${L}" "\$@"
EOF

chmod +x luajit
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}
