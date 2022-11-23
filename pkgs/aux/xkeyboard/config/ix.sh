{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/freedesktop/xkeyboard-config/archive/refs/tags/xkeyboard-config-2.37.tar.gz
sha:3f578ae674d9a01a6d0bba23f3ff55b9e07c335e7bb81e9eb192eb8efde0176b
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
{% endblock %}

{% block env %}
export XKB_CONFIG="${out}/share/X11/xkb"
{% endblock %}
