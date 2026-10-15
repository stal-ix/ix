{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
sdl12-compat
{% endblock %}

{% block version %}
1.2.78
{% endblock %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-{{self.version().strip()}}.tar.gz
40ec5f0bab13a217ffae7aab0c450f1f798761e91fb185051b5211925c9da11a
{% endblock %}

{% block lib_deps %}
lib/c
{% if opengl %}
{% if linux %}
lib/glu
{% endif %}
lib/opengl
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/sdl/2
{% endblock %}

{% block bld_tool %}
{% if darwin %}
bld/fake(tool_name=install_name_tool)
{% endif %}
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
