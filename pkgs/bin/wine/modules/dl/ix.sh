{% extends '//die/dl/map.sh' %}

{# Every symbol of every Wine unixlib, registered under the module name the
   loader dlopens (x86_64-unix/<m>.so -> <m>). Leaf modules carry the <m>_
   prefix from bin/wine/modules and get it cut here, so dlsym sees the plain
   names (__wine_unix_call_funcs and friends); ntdll and win32u are not
   prefixed. #}

{% block std_box %}
bld/librarian
{{super()}}
{% endblock %}

{% block lib_deps %}
lib/dlfcn
bin/wine/modules
{% endblock %}

{% block export_map %}
for a in ${WINE_MODULES}/libwine_*.a; do
    m=$(basename ${a} .a)
    m=${m#libwine_}

    case ${m} in
        ntdll|win32u)
            listsym ${a} | while read s; do
                echo "${m} ${s} ${s}"
            done
            ;;
        *)
            listsym ${a} | while read s; do
                echo "${m} ${s#${m}_} ${s}"
            done
            ;;
    esac
done
{% endblock %}
