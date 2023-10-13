{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.9.4.tar.gz
sha:148356027ee8d586adebb6513a94d76accc79da9597109ace5c445b09d383093
{% endblock %}

{% block bld_libs %}
lib/uv
lib/lua
lib/uv/l
lib/intl
lib/vterm
lib/termkey
lib/unibilium
lib/msgpack/c
lib/tree/sitter
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/gettext
bin/neovim/puc(lua_ver=puc/5/2)
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block setup_tools %}
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
{% endblock %}
