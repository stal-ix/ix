{% extends '//lib/lua/t/ix.sh' %}

{% block fetch %}
https://luajit.org/download/LuaJIT-2.0.5.tar.gz
md5:48353202cbcacab84ee41a5a70ea0a2c
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

{% block env_lib %}
export LUA_INCLUDE_DIR="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=LuaJIT \${CMFLAGS}"
{% endblock %}
