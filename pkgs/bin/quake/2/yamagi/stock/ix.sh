{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_8_30.tar.gz
sha:388ba424cbe29e4a8e8dda0d448676600a00c66e3e4edc2b9660b551e19a3095
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
