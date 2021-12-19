{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://luajit.org/download/LuaJIT-2.0.5.tar.gz
48353202cbcacab84ee41a5a70ea0a2c
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts/mix.sh
{{super()}}
{% endblock %}

{% block make_flags %}
BUILDMODE=static
TARGET_LIBS="${PWD}/dl.o"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
mv luajit-2.0/* ./
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|.*return 0.*open failed.*|if (f == NULL) return (strstr(filename, ".so") > 0 \&\& dlopen(filename, 0) != NULL);|' \
    -i src/lib_package.c
{% endblock %}

{% block build %}
(
    IFS=":"; for x in ${LUA_PATH}; do
        cat ${x}/mod
    done
)| while read l; do
    n=$(echo ${l} | sed -e 's|.*luaopen_||')
    dl_stubs ${n} << EOF
${l}
EOF
done > dl.cpp

${CC} -c dl.cpp

{{super()}}
{% endblock %}

{% block env %}
export LUA_INC_PATH="${out}/include"
export CMFLAGS="-DWITH_LUA_ENGINE=LuaJIT \${CMFLAGS}"
{% endblock %}
