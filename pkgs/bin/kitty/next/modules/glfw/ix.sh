{% extends '//bin/kitty/next/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp kitty/glfw-wayland.so ${out}/lib/libglfw-wayland.a
{% endblock %}
