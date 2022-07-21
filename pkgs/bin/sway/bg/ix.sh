{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/swaywm/swaybg/archive/refs/tags/v1.1.tar.gz
sha:958f425310514ae2aae064595c3e7efba2187b0d2947136c49188558fdb367b1
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bin/wayland/protocols
{% endblock %}
