{% extends '//bin/kitty/t/ix.sh' %}

{% block bld_libs %}
lib/dbus
lib/rsync
lib/opengl
lib/wayland
lib/glfw/deps
lib/xkbcommon
lib/fontconfig
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/wayland
lib/curses/n
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
