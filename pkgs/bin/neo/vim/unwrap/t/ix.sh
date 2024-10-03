{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.10.2.tar.gz
sha:546cb2da9fffbb7e913261344bbf4cf1622721f6c5a67aa77609e976e78b8e89
{% endblock %}

{% block bld_libs %}
lib/uv
lib/lua
lib/uv/l
lib/intl
lib/vterm
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
