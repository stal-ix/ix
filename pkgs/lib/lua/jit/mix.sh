{% extends '//lib/lua/t/mix.sh' %}

{% block fetch %}
https://luajit.org/download/LuaJIT-2.0.5.tar.gz
48353202cbcacab84ee41a5a70ea0a2c
{% endblock %}

{% block make_flags %}
BUILDMODE=static
TARGET_LIBS="${PWD}/dl.o"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include; mv luajit-2.0/* ./
{% endblock %}

{% block lua_dlopen %}
src/lib_package.c
{% endblock %}

{% block env %}
export LUA_INC_PATH="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=LuaJIT \${CMFLAGS}"
{% endblock %}
