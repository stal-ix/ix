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
editor/neovim/luafat/mix.sh
{% endblock %}

{% block cmake_flags %}
PREFER_LUA=ON
LUA_INCLUDE_DIR="${LUA_INC_PATH}"
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}
