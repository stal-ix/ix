{% extends '//die/c/make.sh' %}

# check bin/quake/2/yamagi

{% block pkg_name %}
yquake2
{% endblock %}

{% block version %}
8.60
{% endblock %}

{% block fetch %}
https://github.com/yquake2/yquake2/archive/refs/tags/QUAKE2_{{self.version().strip().replace('.', '_')}}.tar.gz
7d7feb96cabdcf823273ef5056b20bd36fe5e1c5f20f476ef32b94a1ae37967a
{% endblock %}

{% block bld_libs %}
lib/c
lib/sdl/3
lib/opengl
lib/curl/dl
lib/sdl/deps
lib/execinfo
lib/openal/dl
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bin/pkg/conf
bld/librarian
bld/wrap/cc/plugins/rdynamic/fake
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
