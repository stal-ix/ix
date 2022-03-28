{% extends '//mix/make.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/readline
{% endblock %}

{% block bld_tool %}
bld/scripts/dlfcn
{% endblock %}

{% block script_init_env %}
export LUA_PATH=
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|.*return 0.*open failed.*|if (f == NULL) return (strstr(filename, ".so") > 0 \&\& dlopen(filename, 0) != NULL);|' \
    -i {{self.lua_dlopen().strip()}}
{% endblock %}

{% block build %}
(
    IFS=":"; for x in ${LUA_PATH}; do
        cat ${x}/mod
    done
) | while read l; do
    n=$(echo ${l} | sed -e 's|.*luaopen_||')
    dl_stubs ${n} << EOF
${l}
EOF
done > dl.cpp

${CC} -c dl.cpp

{{super()}}
{% endblock %}
