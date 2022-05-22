{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/vaxerski/Hyprland/archive/fa38dfd416b664033a96bb4af764fd54f7257d7b.zip
sha:276f97d690b6cacde608e13bd42209384345a7c063712e1db5b50a0355dcfea5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pango
lib/cairo
lib/input
lib/wayland
lib/wlroots
lib/xkbcommon
lib/mesa/gl/dl
lib/mesa/egl/dl
lib/mesa/glesv2/dl
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}

{% block patch %}
sed -e 's| xcb||' -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
NO_XWAYLAND=ON
{% endblock %}
