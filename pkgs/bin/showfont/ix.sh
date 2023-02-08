{% extends '//lib/sdl/2/ttf/t/ix.sh' %}

{% block bld_libs %}
lib/glu
lib/shim/fake(lib_name=OpenGL)
lib/shim/fake(lib_name=GLX)
lib/sdl/deps
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/glfont ${out}/bin/
cp ${tmp}/obj/showfont ${out}/bin/
{% endblock %}
