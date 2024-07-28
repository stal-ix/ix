{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_40.tar.gz
sha:02c8c8e7b090d24e960c7575c07110154691ba3987daf996f24370a3449714af
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
