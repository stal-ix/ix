{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.7.2.tar.gz
sha:ccab8ca02a0c292de9ea14b39f84f90b635a69282de38a6b4ccc8565bc65d096
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

{% block patch %}
sed -e 's|val->string|val->string.str|' -i src/nvim/terminal.c
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
