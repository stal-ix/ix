{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.8.0.tar.gz
sha:505e3dfb71e2f73495c737c034a416911c260c0ba9fd2092c6be296655be4d18
{% endblock %}

{% block bld_libs %}
lib/uv
lib/lua
lib/uv/l
lib/intl
lib/vterm
lib/termkey
lib/msgpack/c
lib/unibilium
lib/tree/sitter
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/gettext
bin/neovim/luafat
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block setup_tools %}
L=$(which luajit)

cat << EOF > luajit
#!$(which sh)
export LUA_PATH="${LUA_PATH}:\${LUA_PATH}"
exec "${L}" "\$@"
EOF

chmod +x luajit
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
