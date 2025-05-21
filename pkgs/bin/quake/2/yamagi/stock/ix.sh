{% extends '//die/c/make.sh' %}

{% block pkg_name %}
yquake2
{% endblock %}

{% block version %}
8.51
{% endblock %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:54c530305dd96cf4536dee3633864f3e326a5efd33528314ac64e009201318e7
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/3
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
bin/pkg/conf
bld/librarian
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
WITH_SDL3=yes
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp quake2 ${out}/bin/
{% endblock %}
