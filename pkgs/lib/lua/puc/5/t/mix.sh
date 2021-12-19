{% extends '//lib/lua/t/mix.sh' %}

{% block make_flags %}
INSTALL_TOP=${out}
LIBS="${PWD}/dl.o"
{% endblock %}

{% block make_target %}
{{target.os}}
{% endblock %}

{% block lua_dlopen %}
src/loadlib.c
{% endblock %}

{% block env %}
export LUA_INC_PATH="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=Lua \${CMFLAGS}"
{% endblock %}
