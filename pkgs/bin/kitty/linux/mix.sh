{% extends '//bin/kitty/t/mix.sh' %}

{% block bld_libs %}
lib/dbus
lib/mesa
lib/rsync
lib/wayland
lib/xkbcommon
lib/fontconfig
{{super()}}
lib/drivers/3d
lib/wayland/dl
lib/mesa/gl/dl
lib/mesa/egl/dl
{% endblock %}

{% block bld_tool %}
lib/curses/n
bin/wayland/protocols
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}

sed -e "s|'gl'|'opengl'|" -e 's|x11 wayland|wayland|' -i setup.py

find glfw/ -type f | while read l; do
    sed -e 's|set_titlebar_color|glfw_set_titlebar_color|' -i ${l}
done

find . -type f -name '*.py' | while read l; do
    sed -e 's|is_wayland()|True|' \
        -e 's|glfw_module = .*|glfw_module = "wayland"|' \
        -i ${l}
done
{% endblock %}
