{% extends '//die/proxy.sh' %}

{% block bld_libs %}
lib/sdl/2
{% endblock %}

{% block bld_tool %}
bld/compiler
bld/librarian
{% endblock %}

{% block install %}
mkdir ${out}/lib
cd ${out}/lib
cp ${SDL2_LIBRARY} ./libSDL2_chimera.a
patchns libSDL2_chimera.a V2_
{% endblock %}

{% block env %}
export SDL2_CHIMERA="${out}/lib/libSDL2_chimera.a"
{% endblock %}
