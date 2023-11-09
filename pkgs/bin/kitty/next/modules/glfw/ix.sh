{% extends '//bin/kitty/next/t/ix.sh' %}

{% block install %}
mkdir ${out}/lib
cp kitty/glfw-wayland.so ${out}/lib/libglfw-wayland.a
llvm-objcopy \
    --redefine-sym encode_utf8=glfw_encode_utf8 \
    ${out}/lib/libglfw-wayland.a
{% endblock %}
