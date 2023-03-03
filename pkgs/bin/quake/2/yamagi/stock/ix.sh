{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_20.tar.gz
sha:1a751e5a78148ee0a7dc6c73f856af57fa7b6cc07a52d30b094f88f4f76adf24
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/2
lib/opengl
lib/curl/dl
lib/sdl/deps
lib/execinfo
lib/openal/dl
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/librarian
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp quake2 ${out}/bin/
{% endblock %}
