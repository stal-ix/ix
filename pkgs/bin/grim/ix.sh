{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/grim/archive/v1.4.0.tar.gz
sha:66729ae654546404f50ed163055310dd23ed52cc5a881d39752c0cd076e3d7aa
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jpeg
lib/pixman
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
