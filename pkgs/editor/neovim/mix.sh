{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/neovim/neovim/archive/refs/tags/v0.6.0.tar.gz
150cfca071cd2655a7ade4679eb56cef
{% endblock %}

{% block bld_libs %}
lib/uv/mix.sh
lib/lua/mix.sh
lib/uv/l/mix.sh
lib/intl/mix.sh
lib/vterm/mix.sh
lib/iconv/mix.sh
lib/termkey/mix.sh
lib/msgpack/c/mix.sh
lib/unibilium/mix.sh
lib/tree/sitter/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/gperf/mix.sh
editor/neovim/luafat/mix.sh
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block setup_tools %}
cat << EOF > lua
#!$(which dash)
export LUA_PATH="${LUA_PATH}:\${LUA_PATH}"
exec "$(which lua)" "\$@"
EOF

chmod +x lua
{% endblock %}

{% block patch %}
sed -e 's|val->string|val->string.str|' -i src/nvim/terminal.c
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}
