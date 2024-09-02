{% extends '//lib/lua/t/ix.sh' %}

{% block fetch %}
https://github.com/LuaJIT/LuaJIT/archive/refs/tags/v2.0.5.tar.gz
sha:8bb29d84f06eb23c7ea4aa4794dbb248ede9fcb23b6989cbef81dc79352afc97
{% endblock %}

{% block lib_deps %}
{{super()}}
# for unwinder
lib/c++
{% endblock %}

{% block make_flags %}
BUILDMODE=static
TARGET_LIBS="${PWD}/dl.o"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include; mv luajit*/* ./
{% endblock %}

{% block lua_dlopen %}
src/lib_package.c
{% endblock %}

{% block env %}
export LUA_INCLUDE_DIR="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=LuaJIT \${CMFLAGS}"
{% endblock %}
