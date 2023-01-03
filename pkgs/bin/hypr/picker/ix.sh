{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprpicker/archive/6dc7f3321e04dca1c588b930856cae1fcc90f40a.zip
sha:4b5230d303e040868dc45a92713a32a7063805c752df7b3ab57470bc48db8310
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/jpeg
lib/cairo
lib/pango
lib/wayland
lib/wlroots/17
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

{% block patch %}
sed -e 's|c++23|c++2b|' -i CMakeLists.txt
sed -e 's|pLS->screenBuffer.data|(char*)pLS->screenBuffer.data|' -i src/hyprpicker.cpp
{% endblock %}

{% block cpp_defines %}
uint=uint32_t
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/hyprpicker ${out}/bin/
{% endblock %}
