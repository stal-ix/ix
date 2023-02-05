{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/archive/xkeyboard-config-2.38/xkeyboard-config-xkeyboard-config-2.38.tar.bz2
sha:5ab92ce8099eee66622808954e08d0e8dea3d254df100c7f636ed6cd68e8d9cd
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}
