{% extends '//die/dl/map.sh' %}

{% block lib_deps %}
lib/sdl/chimera
{% endblock %}

{% block bld_tool %}
bld/librarian
{% endblock %}

{% block export_map %}
listsym $(findlib libSDL2.a) | grep 'V2_SDL' | while read l; do
    r=$(echo ${l} | sed -e 's|V2_||')
    echo "SDL2-2 ${r} ${l}"
done
{% endblock %}
