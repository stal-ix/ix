{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.7.0.tar.gz
sha:792a9c55d5d5f4a5148d475847267df309d65fb20f05523f21c1319ea8a6c7df
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
