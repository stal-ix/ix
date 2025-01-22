{% extends '//die/c/cmake.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/jpeg
lib/cairo
lib/pango
lib/opengl
lib/wayland
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block bld_tool %}
bld/make
bld/wayland
{% endblock %}

{% block build %}
make protocols
{{super()}}
{% endblock %}

{% block cpp_defines %}
uint=uint32_t
{% endblock %}
