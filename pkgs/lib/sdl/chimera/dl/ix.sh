{% extends '//die/dl/map.sh' %}

{% block lib_deps %}
lib/sdl/chimera
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block export_map %}
listsym ${SDL2_CHIMERA} | cut_prefix {{target.symbol_prefix}} | grep -v '\$' | grep 'V2_' | while read l; do
    r=$(echo ${l} | sed -e 's|V2_{{target.symbol_prefix}}||')
    echo "SDL2-2 ${r} ${l}"
done
{% endblock %}
