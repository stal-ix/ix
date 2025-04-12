{% extends '//die/c/cmake.sh' %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6826c4812e96995d29a98586d44fbee7c9b2045485d50d174becd6d5242b3319
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
