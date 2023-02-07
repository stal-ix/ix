{% extends '//lib/sdl/2/ttf/ix.sh' %}

{% block bld_libs %}
lib/glu
lib/shim/fake(lib_name=OpenGL)
lib/shim/fake(lib_name=GLX)
lib/sdl/deps
{{super()}}
{% endblock %}
