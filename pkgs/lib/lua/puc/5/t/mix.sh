{% extends '//mix/template/make.sh' %}

{% block lib_deps %}
lib/c/mix.sh
{% endblock %}

{% block bld_libs %}
lib/readline/mix.sh
{% endblock %}

{% block bld_tool %}
lib/dlfcn/scripts/mix.sh
{% endblock %}

{% block make_flags %}
INSTALL_TOP=${out}
LIBS="${PWD}/dl.o"
{% endblock %}

{% block make_target %}
linux
{% endblock %}

{% block test_execute %}
make test
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|.*return 0.*open failed.*|if (f == NULL) return (strstr(filename, ".so") > 0 \&\& dlopen(filename, 0) != NULL);|' \
    -i src/loadlib.c
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
export CMFLAGS="-DWITH_LUA_ENGINE=Lua \${CMFLAGS}"
{% endblock %}
