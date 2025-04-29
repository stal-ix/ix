{% extends '//die/c/make.sh' %}

{% block pkg_name %}
yquake2
{% endblock %}

{% block version %}
8.50
{% endblock %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:d6c08878de2c96ea8f964d9b53692082f58fc4f016617a1e6a2f6095f4237eae
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
