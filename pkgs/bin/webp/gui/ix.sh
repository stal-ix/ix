{% extends '//bin/webp/ix.sh' %}

{% block bld_libs %}
lib/glu
lib/sdl/1
lib/sdl/deps
lib/freeglut
lib/shim/fake(lib_name=OpenGL)
lib/shim/fake(lib_name=GLX)
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|WEBP_BUILD_VWEBP OFF|WEBP_BUILD_VWEBP ON|' -i CMakeLists.txt
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/vwebp_sdl ${out}/bin/
{% endblock %}
