{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
sdl12-compat
{% endblock %}

{% block version %}
1.2.68
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
sha:63c6e4dcc1154299e6f363c872900be7f3dcb3e42b9f8f57e05442ec3d89d02d
{% endblock %}

{% block lib_deps %}
lib/c
{% if linux %}
lib/glu
{% endif %}
{% if opengl %}
lib/opengl
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/sdl/2
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libSDL-1.2.a libSDL.a || mv libSDL-1.2.0.a libSDL.a
cd pkgconfig
cp sdl12_compat.pc sdl.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL \${CPPFLAGS}"
{% endblock %}
