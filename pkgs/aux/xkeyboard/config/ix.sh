{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/archive/xkeyboard-config-2.39/xkeyboard-config-xkeyboard-config-2.39.tar.bz2
sha:eb0b8592d793ea14c5d6f58270eac4e7326f80c2bd96e4cfb27e506a14b4f87f
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}
