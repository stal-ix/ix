{% extends '//mix/dl_stubs.sh' %}

{% block lib_deps %}
lib/sdl/1/chimera
{% endblock %}

{% block export_map %}
llvm-nm --defined-only --extern-only --no-weak ${lib_sdl_1_chimera}/lib/libSDL2.a | grep 'V2_SDL' | sed -e 's|.* ||' | sort | uniq | while read l; do
    r=$(echo ${l} | sed -e 's|V2_||')
    echo "SDL2-2 ${r} ${l}"
done
{% endblock %}
