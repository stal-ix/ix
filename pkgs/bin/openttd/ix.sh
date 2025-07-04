{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
OpenTTD
{% endblock %}

{% block version %}
14.1
{% endblock %}

{% block fetch %}
https://github.com/OpenTTD/OpenTTD/archive/refs/tags/{{self.version().strip()}}.tar.gz
56f30930e9bef5b97ebcfc643c35708429a9b1ad80f9ff80e4ead5935b745d82
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/c++
lib/png
lib/lzo
lib/icu
lib/glu
lib/sdl/2
lib/sdl/deps
lib/freetype
lib/fontconfig
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
OPTION_USE_THREADS=OFF
{% endblock %}

{% block bld_tool %}
# for man
bin/gzip
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/games ${out}/bin
{% endblock %}
