{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.10.3.tar.gz
sha:39fab47d241da7b9418823cc563c689d522c1c4b2def04036393834f3f1ca94c
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
