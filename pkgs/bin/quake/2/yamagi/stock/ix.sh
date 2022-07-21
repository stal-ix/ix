{% extends '//die/c/make.sh' %}

{% block fetch %}
https://deponie.yamagi.org/quake2/quake2-8.10.tar.xz
sha:93d625f67bd365d943113f6aa7c65f6fd2bd4c46c4ab77eedc4642735c143ea1
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
bld/scripts/dlfcn
bld/scripts/librarian
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp quake2 ${out}/bin/
{% endblock %}
